import json

from db import db, Location, User, Comment, Position, Asset
import users_dao
from flask import Flask, request
from datetime import datetime
from geopy import distance
from geopy.geocoders import Nominatim

app = Flask(__name__)
db_filename = "spaced_out.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()


# generalized response formats
def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(data, code=404):
    return json.dumps(data), code

def extract_token(request):
    """
    Function which extracts token from authorization header of a request
    """
    header = request.headers.get("Authorization")
    if header is None:
        return False, failure_response({"error": "No authorization header provided."})

    bearer_token = header.replace("Bearer ", "").strip()
    if bearer_token is None or not bearer_token:
        return False, failure_response({"error": "Invalid authorization header."})

    return True, bearer_token

"""
POST requests
"""
@app.route("/api/locations/busyness/<int:location_id>/", methods=["POST"])
def update_busyness(location_id):
    """
    Endpoint for updating the busyness of given location
    """
    # checking if location exists
    location = Location.query.filter_by(id=location_id).first()
    if (location is None):
        return failure_response({"error": "This location does not exist."})
    
    new_busyness = 0
    counter = 0
    comment_lst = Comment.query.filter_by(location_id=location_id).all()

    if comment_lst is not None:
        for comment in comment_lst:
            # For testing!!
            if comment.session_expiration >= datetime.now():
                counter += 1
                new_busyness += comment.number

    location.busyness = new_busyness/counter
    db.session.commit()

    return success_response({"busyness": location.busyness})

@app.route("/api/favorites/<int:location_id>/", methods=["POST"])
def add_favorite(location_id):
    """
    Endpoint for marking a Location as a favorite of given User
    """
    # check if location exists
    location = Location.query.filter_by(id=location_id).first()
    
    if (location is None):
        return failure_response({"error": "This location does not exist."})

    body = json.loads(request.data)
    user_id = body.get("user_id")

    # checking if required fields were provided
    if (user_id is None):
        return failure_response({"error": "You did not provide all required fields!"}, 400)

    user = User.query.filter_by(id=user_id).first()
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})

    location.fav_users.append(user)
    user.favorites.append(location)
    db.session.commit()

    return success_response(location.simple_serialize(), 200)

@app.route("/api/favorites/<int:location_id>/remove/", methods=["POST"])
def remove_favorite(location_id):
    """
    Endpoint which removes favorite marker of User and Location
    """
    # check if location exists
    location = Location.query.filter_by(id=location_id).first()
    if location is None:
        return failure_response({"error": "This location does not exist."})

    body = json.loads(request.data)
    user_id = body.get("user_id")
    # check if user_id is provided
    if user_id is None:
        return failure_response({"error": "You did not provide all required fields!"}, 400)

    # check if user exists
    user = User.query.filter_by(id=user_id).first()
    if (user is None):
        return failure_response({"error": "User not found."})

    check = False
    for f in user.favorites:
        if f.id == location_id:
            check = True
            break
    if not check:
        return failure_response({"error": "User has not been added to this course."})

    location.fav_users.remove(user)
    db.session.commit()
    return success_response(user.serialize())

@app.route("/api/comments/<int:location_id>/", methods=["POST"])
def add_comment(location_id):
    """
    Endpoint for adding a comment for given location by given user
    """
    # checking if location exists
    location = Location.query.filter_by(id=location_id).first()
    if (location is None):
        return failure_response({"error": "This location does not exist."})

    body = json.loads(request.data)
    user_id = body.get("user_id")
    text = body.get("text")
    number = body.get("number")
    latitude = body.get("latitude")
    longitude = body.get("longitude")

    # checking if required fields were provided
    if (user_id is None or number is None):
        return failure_response({"error": "User did not provide all required fields!"}, 400)

    user = User.query.filter_by(id=user_id).first()
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})
    new_pos = Position(user_id=user_id, latitude=latitude, longitude=longitude, timestamp=datetime.now())
    db.session.add(new_pos)

    # check if latitude/longitude is close to the location which the Useer is trying to add a comment to
    user_loc = (latitude, longitude)
    loc_loc = (location.latitude, location.longitude)
    dist = distance.distance(user_loc, loc_loc).km
    
    # if position was <= 1 km of Location, then they can add Comment for that Location
    if dist <= 1:
        new_comment = Comment(text=text, number=number, user_id=user_id, location_id=location_id)
        db.session.add(new_comment)
        db.session.commit()
        return success_response(new_comment.simple_serialize(), 200)
    
    db.session.commit() # committing db.session.add(new_pos) in case the if statement above does not hold and commit all changes
    return failure_response({"error": "User can't leave comment on location they are not at."})

@app.route("/api/users/", methods=["POST"])
def register_user():
    """
    Endpoint for creating a new user
    """
    body = json.loads(request.data)
    name = body.get("name")
    username = body.get("username")
    email = body.get("email")
    password = body.get("password")

    # checking if required fields were provided
    if (name is None or email is None or password is None or username is None):
        return failure_response({"error": "You did not provide all required fields!"}, 400)

    success, user = users_dao.create_user(name,username,email,password)
    
    if not success:
        return failure_response({"error": "User with this info already exists."}, 400)

    return success_response({
        "user_id": user.id,
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })

@app.route("/api/users/login/", methods=["POST"])
def login():
    """
    Endpoint which allows a user to log in to their account
    """
    body = json.loads(request.data)
    email = body.get("email")
    password = body.get("password")

    if email is None or password is None:
        return failure_response({"error": "User did not provide all required fields."}, 400)
    
    success, user = users_dao.verify_credentials(email, password)

    if not success:
        return failure_response({"error": "Password or email is incorrect."}, 401)
    
    return success_response({
        "user_id": user.id,
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })

@app.route("/api/users/logout/", methods=["POST"])
def logout():
    """
    Endpoint which allows user to logout (pass in session token)
    """
    success, session_token = extract_token(request)

    if not success:
        return failure_response({"error": "Update token could not be extracted."}, 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response({"erorr": "Invalid session token."}, 400)
    
    user.session_token = ""
    user.session_expiration = datetime.now()
    user.update_token = ""
    db.session.commit()

    return success_response({"message": "User has successfully logged out."})

@app.route("/api/users/upload/<int:user_id>/", methods=["POST"])
def upload(user_id):
    """
    Endpoint which allows Users to upload image for their profile picture
    Uploads image to AWS given base64 form, stores URL of image in AWS
    """
    body = json.loads(request.data)
    image_data = body.get("image_data")

    if image_data is None:
        return failure_response({"error": "No base64 image is found."})

    user = User.query.filter_by(id=user_id).first()
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})

    asset = Asset(image_data=image_data, user_id=user_id)
    db.session.add(asset)
    db.session.commit()

    return success_response(asset.serialize(), 201)
    

"""
DELETE requests
"""
@app.route("/api/users/", methods=["DELETE"])
def delete_user():
    """
    Protected endpoint which allows a user to delete their account
    """
    success, session_token = extract_token(request)

    if not success:
        return failure_response({"error": "Session token could not be extracted."}, 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response({"erorr": "Invalid session token."}, 400)

    db.session.delete(user)
    db.session.commit()
    return success_response(user.simple_serialize())

@app.route("/api/comments/", methods=["DELETE"])
def delete_comment():
    """
    Protected endpoint which allows a user to delete a comment that they wrote
    """
    success, session_token = extract_token(request)

    if not success:
        return failure_response({"error": "Session token could not be extracted."}, 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response({"erorr": "Invalid session token."}, 400)

    user_id = user.id
    comment = Comment.query.filter_by(user_id=user_id).first()
    db.session.delete(comment)
    db.session.commit()

    return success_response(comment.simple_serialize(), 200)

@app.route("/api/session/", methods=["POST"])
def update_session():
    """
    Endpoint for updating the session (pass in update token) of a user
    """
    success, update_token = extract_token(request)

    if not success:
        return failure_response({"error": "Update token could not be extracted."}, 400)

    success_user, user = users_dao.renew_session(update_token)

    if not success_user:
        return failure_response({"error": "Invalid update token."}, 400)
    
    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })

"""
GET requests
"""
@app.route("/api/users/<int:id>/")
def get_user_by_id(id):
    """
    Endpoint for getting the user with given id
    """
    user = User.query.filter_by(id=id).first()
    
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})

    return success_response(user.serialize())

@app.route("/api/locations/<int:id>/")
def get_location_by_id(id):
    """
    Endpoint for getting the location with given id
    """
    location = Location.query.filter_by(id=id).first()
    
    # check if user exists
    if (location is None):
        return failure_response({"error": "This location does not exist."})

    return success_response(location.serialize())

@app.route("/api/comments/<int:location_id>/") 
def get_comments_by_location(location_id):
    """
    Endpoint for getting all comments associated with a given location
    """
    location = Location.query.filter_by(id=location_id).first()
    # check if user exists
    if (location is None):
        return failure_response({"error": "This location does not exist."})

    comments = [comment.serialize() for comment in Comment.query.filter_by(location_id=location_id)]
    return success_response({"comments": comments})


"""
Endpoint to hit when pre-populating database
Is Not called on the frontend side
"""
@app.route("/api/locations/", methods=["POST"])
def create_location():
    """
    Endpoint for creating a location
    """
    body = json.loads(request.data)
    name = body.get("name")
    address = body.get("address")

    # checking if required fields were provided
    if (name is None):
        return failure_response({"error": "User did not provide all required fields."}, 400)

    new_location = Location(name=name, address=address)
    db.session.add(new_location)
    db.session.commit()
    return success_response(new_location.serialize(), 201)

@app.route("/api/locations/delete/<int:id>/", methods=["DELETE"])
def delete_location(id):
    """
    Endpoint for deleteing a location by its id 
    """
    location = Location.query.filter_by(id=id).first()
    if location is None:
        return failure_response({"error": "This location does not exist."})
    
    db.session.delete(location)
    db.session.commit()

    return success_response(location.simple_serialize())

# Not currently used by Frontend but useful for planned features of the app
@app.route("/api/positions/<int:user_id>/", methods=["POST"])
def add_position(user_id):
    """
    Endpoint for adding positional data for a certain user
    """
    body = json.loads(request.data)
    latitude = body.get("latitude")
    longitude = body.get("longitude")

    # checking if required fields were provided
    if (user_id is None or latitude is None or longitude is None):
        return failure_response({"error": "User did not provide all required fields!"}, 400)

    user = User.query.filter_by(id=user_id).first()
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})

    new_position = Position(user_id=user_id, latitude=latitude, longitude=longitude)
    db.session.add(new_position)
    db.session.commit()

    return success_response(new_position.serialize(), 200)

@app.route("/api/positions/<int:user_id>/")
def get_user_positions(user_id):
    """
    Endpoint for getting all positional data for a given user.
    """
    user = User.query.filter_by(id=user_id).first()
    # check if user exists
    if (user is None):
        return failure_response({"error": "This user does not exist."})

    positions = [pos.simple_serialize() for pos in Position.query.filter_by(user_id=user_id)]
    return success_response({"positions": positions}, 200)

# get_all_comments() not necessary for frontend (just for testing)
@app.route("/api/comments/")
def get_all_comments():
    """
    Endpoint for getting all comments (regardless of Location, User or expiration)
    """
    comments = [comment.serialize() for comment in Comment.query.all()]
    return success_response({"comments": comments})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
