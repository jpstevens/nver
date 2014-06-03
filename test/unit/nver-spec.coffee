nver = require "../../src/nver"
expect = require("chai").expect

describe "nver", ->

  ver = "1.1.1"
  lowVer = "0.0.0"

  describe "#increment", ->
        
    describe "default behaviour", ->

      it "increments patch version", ->
        expect(nver.increment ver).to.equal(nver.increment ver, "patch")
        expect(nver.increment ver).to.not.equal(nver.increment ver, "minor")
        expect(nver.increment ver).to.not.equal(nver.increment ver, "major")

    describe "a patch version", ->

      it "increases value correctly", ->
        expect(nver.increment ver, "patch").to.equal("1.1.2")

    describe "a minor version", ->

      it "increases value correctly", ->
        expect(nver.increment ver, "minor").to.equal("1.2.1")

    describe "a major version", ->

      it "increases value correctly", ->
        expect(nver.increment ver, "major").to.equal("2.1.1")

    describe "an unknown level", ->

      it "throws an error", ->
        expect( -> nver.decrement(ver, "unknown")).to.throw(Error)

    describe "with 'v0.0.0' format", ->

      it "works correctly", ->
        expect(nver.increment "v#{lowVer}", "patch").to.equal("v0.0.1")
        expect(nver.increment "v#{lowVer}", "minor").to.equal("v0.1.0")
        expect(nver.increment "v#{lowVer}", "major").to.equal("v1.0.0")
        
    describe "with '0.0.0' format", ->

      it "works correctly", ->
        expect(nver.increment lowVer, "patch").to.equal("0.0.1")
        expect(nver.increment lowVer, "minor").to.equal("0.1.0")
        expect(nver.increment lowVer, "major").to.equal("1.0.0")

  describe "#decrement", ->

    describe "default behaviour", ->

      it "decrements patch version", ->
        expect(nver.decrement ver).to.equal(nver.decrement ver, "patch")
        expect(nver.decrement ver).to.not.equal(nver.decrement ver, "minor")
        expect(nver.decrement ver).to.not.equal(nver.decrement ver, "major")

    describe "a patch version", ->

      it "decreases value correctly", ->
        expect(nver.decrement ver, "patch").to.equal("1.1.0")

      it "throws an error if the new version will be less than zero", ->
        expect( -> nver.decrement(lowVer, "patch")).to.throw(Error)

    describe "a minor version", ->

      it "decreases value correctly", ->
        expect(nver.decrement ver, "minor").to.equal("1.0.1")

      it "throws an error if the new version will be less than zero", ->
        expect( -> nver.decrement(lowVer, "minor")).to.throw(Error)

    describe "a major version", ->

      it "decreases value correctly", ->
        expect(nver.decrement ver, "major").to.equal("0.1.1")

      it "throws an error if the new version will be less than zero", ->
        expect( -> nver.decrement(lowVer, "major")).to.throw(Error)

    describe "an unknown level", ->

      it "throws an error", ->
        expect( -> nver.decrement(ver, "unknown")).to.throw(Error)

    describe "with 'v0.0.0' format", ->

      it "works correctly", ->
        expect(nver.decrement "v#{ver}", "patch").to.equal("v1.1.0")
        expect(nver.decrement "v#{ver}", "minor").to.equal("v1.0.1")
        expect(nver.decrement "v#{ver}", "major").to.equal("v0.1.1")
        
    describe "with '0.0.0' format", ->

      it "works correctly", ->
        expect(nver.decrement ver, "patch").to.equal("1.1.0")
        expect(nver.decrement ver, "minor").to.equal("1.0.1")
        expect(nver.decrement ver, "major").to.equal("0.1.1")

      