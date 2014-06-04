expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "decrementing minor version", ->

  expectedMessage = "Minor version decremented to 1.0.1 (was 1.1.1)"

  it "can be executed using 'nver down --minor'", (done) ->
    cmd.exec "nver down --minor", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --minor down'", (done) ->
    cmd.exec "nver --minor down", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()