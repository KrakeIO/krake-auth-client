#Dependencies
request = require 'request'

class KrakeAuthClient

  constructor: (@host)->

  # Public main method for validating a token against the auth server
  validate: (token, callback)->
    auth_url = @host + '/validate/' + token
    request auth_url, (err, res, body)->
      if !err && res.statusCode == 200
        try
          results = JSON.parse body
          if results.status && results.status == 'success'
            callback && callback null, true

          else
            callback && callback 'authentication failed', false

        catch error
          callback && callback "invalid response : #{error}", false

      else 
        callback "auth server is unreachable : #{err}", false

module.exports = KrakeAuthClient