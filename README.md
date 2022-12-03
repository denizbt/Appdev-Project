# Appdev-Project

**Spaced Out** : Find your space on campus.


**Purpose**: Display real-time busyness for various locations on Cornell's campus including libraries, cafes, and dining halls, by allowing Users to add text comments and busyness ratings to each location.

**Features**

User (Account, Profile)
- User authentication (registering, log-in, log-out)
- Profile Picture Image suport (User can upload one profile picture)
- Profile View of User with list of favorite (or starred) locations

Comments
- User Can Add Comment to Location (text such as "stir fry line at Morrison is short!" or add a busyness rating between 1-5 for the location
- Users must be within 1 km of a Location in order to add a comment
- Comments expire after 2 hours (expired comments are no longer displayed for accurate information)
- Busyness rating is also re-calculated to disregard older ratings

Location
- Screen for each Location which shows all (recent) Comments and numerical busyness rating

Requirements (Backend)
- Implemented Authentication and Images (profile picture)
- ~15 Routes (more than 1 each of POST, GET, DELETE routes)
- 5 Tables (User, Location, Comment, Position, Asset) with one-to-many relationships between User + Location and Comment, and many-to-many relationship between User and Location with favorites feature
- API Specification on Github repo (Backend_API_Specifications.pdf)

Requirements (iOS Frontend)
- SwiftUI
- ??? screens

Screenshots
