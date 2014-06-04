expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "the 'nver current' command", ->

  expectedMessage = "1.1.1"

  it "returns the cerrent version", (done) ->
    cmd.exec "nver current", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
