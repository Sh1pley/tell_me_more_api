# Tell Me More API

This is to be an external rails API that will store/serve users from a postgresql db

My intention is to seperate the back end and front end to better learn/teach myself testing in React -- one day?
and offer stability to the API for updates that shouldn't break front end stability as everything will
be served as JSON.

Feb 25.. about 830 pm.. 
  - this stateless API business is interesting but also confusing.

## What works?
  POST, GET and PUT/PATCH request

## What doesn't yet!

WIP:
  Adding Doorkeeper to offer OAuth 2 authentication
  * accepting requests from an external React App that will offer CRUD to Users objects in the db
    - this works through postman requests.. working on fleshing out Auth now.
    
  Add geolocation on login to update lat/long to later be used on the client side.
  
# Project is still very much a work in progress!
