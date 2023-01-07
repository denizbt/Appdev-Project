# Spaced Out Application

**Spaced Out** : Find your space on campus.


**Purpose**: Display real-time traffic of all students within a certain area of various locations on Cornell's campus including libraries, cafes, and dining halls, by allowing users to add text comments and update how busy each location is (or busyness rating).

**Features**

User (Account, Profile)
- User authentication (registering, log-in, log-out)
- Profile Picture Image suport (User can upload one profile picture which is uploaded to Amazon S3 Storage and persists)
- Profile View of User with list of favorited locations (currently only functional in the backend)
- User can delete their account (currently only functional in the backend)

Comments
- User can Add Comment to Location (text such as "stir fry line at Morrison is short!" or add a busyness rating between 1-5 for the location
- Users must be within 1 km of a Location in order to add a comment (latitude / longitude of User is given and geopy(+) modules are used in backend to calculate distance from Location)
- Comments "expire" after 2 hours (expired comments are no longer displayed for accurate information)
- Busyness rating is also re-calculated to disregard ratings which are older than 2 hours
- User can delete a given comment (currently only functional on the backend)

Location
- Pop up screen for each Location shows all (recent) Comments, numerical and qualitative busyness rating, and opening hours of the cafe/library/dining hall

Requirements (Backend)
- We implemented ~15 routes (more than 1 each of POST, GET, DELETE routes)
- There are 5 Tables (User, Location, Comment, Position, Asset) with one-to-many relationships between User + Location and Comment, and many-to-many relationship between User and Location for favorites feature (which is functional in the backend).
- API Specification on Github repo (Backend_API_Specifications.pdf)
- The app uses Authentication (create account and sign in) and Images (profile picture)

Requirements (iOS Frontend)
1. We used AutoLayout using NSLayoutConstraint for the front end design 
2. In ViewController, we used two UICollectionView: one for filters and one for the places. Also in DetailViewController, we included a UITableView for posted comments. 
3. We had multiple screens, which we navigate between using push and present. For example, when login authentication is successful, we push the ViewController (our Home Screen). 
4. Many of the features showcased above use network requests to endpoints which are detailed in the API specification.

Screenshots:
![Simulator Screen Shot - iPhone 14 Pro - 2022-12-02 at 23 23 17](https://user-images.githubusercontent.com/73197385/205422821-ee97f620-66bc-4a4d-b9d1-2ec031195313.jpeg)

 Screen Shot - iPhone 14 Pro - 2022-12-02 at 23 19 45](https://user-images.githubusercontent.com/73197385/205422502-57de645c-9717-4bdd-863f-f43cf6f35ff3.jpeg)
 
![Simulator Screen Shot - iPhone 14 Pro - 2022-12-02 at 23 17 47](https://user-images.githubusercontent.com/73197385/205422596-3baed671-9569-44a5-921e-83a52382b6f8.jpeg)

![Simulator![Simulator Screen Shot - iPhone 14 Pro - 2022-12-02 at 23 18 01](https://user-images.githubusercontent.com/73197385/205422637-c54f5ddb-f42a-4d18-98c8-731d825f97e0.jpeg)

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-02 at 23 19 02](https://user-images.githubusercontent.com/73197385/205422566-76a18909-b44e-48c9-b6d1-8a960dee07df.jpeg)

