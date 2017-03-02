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
  Feb 28
    - Added API side caching, drastically cuts down on response time, from 1500ms + to sub 300ms !

## What works?
  POST, GET and PUT/PATCH request
  Well Well Well.. I can offer OAuth tokens now and I barely know what those are!
    - j/k had to leverage Devise and its warden method to help route external requests
    to get Doorkeeper to issue tokens

  Doorkeeper to offer OAuth 2 authentication -- Atleast I think it does.

  Hosted on Heruko as a standalone API for funsies

## Testing API calls from your home!

  API host is https://tell-me-more.herokuapp.com/

  In order to get an OAuth token, you would follow these steps

    1 POST request to https://tell-me-more.herokuapp.com/oauth/token
    2 need to include params for
       grant_type = password
       email      = test@example.com
       password   = password
    3 copy down the access_token to be used later

  Geocoded location should now be seen by sending

    1 GET request to https://tell-me-more.herokuapp.com/
    2 with params for
       access_token = whatever your access token from above was.

  Should now see the test user and ip location information from your request.

## What doesn't yet!
  Pretty much everything that a good API can do. Although mini wins are happening.

## WIP:
  - probably in order of getting attention:
    - accepting requests from an external React App that will offer CRUD to Users objects in the db
      - this works through postman request
    - Working on a smart root path.. users#sync is landing for now
    
    #### this has been but on a back burner.. on to React madness!
    - adding actioncable connection route to api_controller..
      - not 100% sure if this is a possible feature of an external api
    
  
# Project is still very much a work in progress!
