expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "the 'nver down' command", ->

  expectedMessage = "Patch version decremented to 1.1.0 (was 1.1.1)"

  it "defaults to incrementing the patch version", (done) ->
    cmd.exec "nver down", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
