KrakeAuthClient = require '../krake_auth_client'

describe "testing to make sure auth server validation service is working", ()->

  it "should respond with success using default token", (done)->
    kac = new KrakeAuthClient 'http://localhost:9808'
    kac.validate 'RELEASETHEKRAKEN', (err, result)->
      expect(err).toEqual null
      expect(result).toEqual true
      done()

  it "should respond with success using special token", (done)->
    kac = new KrakeAuthClient 'http://localhost:9808'
    kac.validate 'RELEASETHEKRAKEN', (err, result)->
      expect(err).toEqual null
      expect(result).toEqual true
      done()

  it "should respond with failed using invalid token", (done)->
    kac = new KrakeAuthClient 'http://localhost:9808'
    kac.validate 'NOTVALID', (err, result)->
      expect(err).toEqual 'authentication failed'
      expect(result).toEqual false
      done()

  it "should respond with failed when calling non-existent server", (done)->
    kac = new KrakeAuthClient 'http://localhost:980'
    kac.validate 'NOTVALID', (err, result)->
      expect(err).toEqual 'auth server is down'
      expect(result).toEqual false
      done()