# Tell Me More API

# Project is still very much a work in progress!

This is to be an external rails API that will store/serve users from a postgresql db

My intention is to seperate the back end and front end to better learn/teach myself testing in React -- one day?
and offer stability to the API for updates that shouldn't break front end stability as everything will
be served as JSON.

## Updates worth updating about!

Feb 25.. about 830 pm.. 
  - this stateless API business is interesting but also confusing.
  - Stateless API app is still magic.. *not really an update!(Feb 26.. before lunch)

Feb 26, 3ish pm..
  - This has been a fun day added:
    - /oauth/token as a request route that will:
      - check request owner against db items
      - if authorized and a member of the users table will respond back with token
      - token is now used to make requests for items out of and to change the Users table
    - /api/v1/users/sync route as a way to refresh, or check token info..
      - and hopefully as a way to geocode by IP location in a near future
    - figured out controller tests.. and the fact that they are not request tests
      -  even though an api controller pretty much is just requests..
    - Heroku awesomeness!

## What works?
  POST, GET and PUT/PATCH request
  Well Well Well.. I can offer OAuth tokens now and I barely know what those are!
    - j/k had to leverage Devise and its warden method to help route external requests
    to get Doorkeeper to issue tokens

  Doorkeeper to offer OAuth 2 authentication -- Atleast I think it does.
  
  Hosted on Heruko as a standalone API for funsies

## What doesn't yet!
  Pretty much everything that a good API can do. Although mini wins are happening.

## WIP:
  - probably in order of getting attention:
    * Add geolocation on login/sync to update lat/long to later be used on the client side.
    - accepting requests from an external React App that will offer CRUD to Users objects in the db
      - this works through postman request
  
    
  
# Project is still very much a work in progress!