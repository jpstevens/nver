expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "incrementing major version", ->

  expectedMessage = "Major version incremented to 2.1.1 (was 1.1.1)"

  it "can be executed using 'nver up --major'", (done) ->
    cmd.exec "nver up --major", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --major up'", (done) ->
    cmd.exec "nver --major up", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --major'", (done) ->
    cmd.exec "nver --major", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
