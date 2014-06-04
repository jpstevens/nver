expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "decrementing patch version", ->

  expectedMessage = "Patch version decremented to 1.1.0 (was 1.1.1)"

  it "can be executed using 'nver down --patch'", (done) ->
    cmd.exec "nver down --patch", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --patch down'", (done) ->
    cmd.exec "nver --patch down", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()