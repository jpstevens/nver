expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "incrementing patch version", ->

  expectedMessage = "Patch version incremented to 1.1.2 (was 1.1.1)"

  it "can be executed using 'nver up --patch'", (done) ->
    cmd.exec "nver up --patch", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --patch up'", (done) ->
    cmd.exec "nver --patch up", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --patch'", (done) ->
    cmd.exec "nver --patch", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
