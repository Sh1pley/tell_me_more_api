# Tell Me More API

This is to be an external rails API that will store/serve users from a postgresql db

My intention is to seperate the back end and front end to better learn/teach myself testing in React -- one day?
and offer stability to the API for updates that shouldn't break front end stability as everything will
be served as JSON.

Feb 25.. about 830 pm.. 
  - this stateless API business is interesting but also confusing.
  - Stateless API app is still magic.. *not really an update!(Feb 26.. before lunch)

## What works?
  POST, GET and PUT/PATCH request
  Well Well Well.. I can offer OAuth tokens now and I barely know what those are!
    - j/k had to leverage Devise and its warden method to help route external requests
    to get Doorkeeper to issue tokens

## What doesn't yet!
  Pretty much everything that a good API can do. Although mini wins are happening.

## WIP:
    Adding Doorkeeper to offer OAuth 2 authentication
    * accepting requests from an external React App that will offer CRUD to Users objects in the db
      - this works through postman requests.. working on fleshing out Auth now.
    
  Add geolocation on login to update lat/long to later be used on the client side.
  
# Project is still very much a work in progress!