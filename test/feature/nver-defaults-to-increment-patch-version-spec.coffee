expect = require("chai").expect
cmd = require "../helpers/cmd"

describe "the 'nver' command", ->

  expectedMessage = "Patch version incremented to 1.1.2 (was 1.1.1)"

  it "defaults to incrementing the patch version", (done) ->
    cmd.exec "nver", (err, stdout, stderr) ->
      expect(stdout).to.contain expectedMessage
      done()
