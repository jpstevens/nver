expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "decrementing major version", ->

  expectedMessage = "Major version decremented to 0.1.1 (was 1.1.1)"

  it "can be executed using 'nver down --major'", (done) ->
    cmd.exec "nver down --major", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()

  it "can be executed using 'nver --major down'", (done) ->
    cmd.exec "nver --major down", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()