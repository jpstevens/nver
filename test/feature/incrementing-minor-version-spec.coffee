expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "incrementing minor version", ->

  expectedMessage = "Minor version incremented to 1.2.1 (was 1.1.1)"

  it "can be executed using 'nver up --minor'", (done) ->
    cmd.exec "nver up --minor", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --minor up'", (done) ->
    cmd.exec "nver --minor up", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --minor'", (done) ->
    cmd.exec "nver --minor", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
