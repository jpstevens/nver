expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "the 'nver init' command", ->

  expectedMessage = "Patch version initialized to 0.0.0"

  it "sets the package version to 0.0.0", (done) ->
    cmd.exec "nver init", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
