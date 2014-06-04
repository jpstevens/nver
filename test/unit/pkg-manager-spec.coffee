expect = require("chai").expect
fs   = require "fs"
path = require "path"
PkgManager = require "../../src/pkg-manager"

describe "nverPkgChanger", ->

  pkgManager = null
  testPackageJSONPath = path.resolve path.resolve(__dirname, "..", ".tmp"), "package.json"
  fixturePackageJSON = fs.readFileSync path.resolve(__dirname
    , ".."
    , "fixtures"
    ,  "package.json"), 'utf-8'

  getTestPackageJSON = -> fs.readFileSync testPackageJSONPath, 'utf-8'

  beforeEach ->
    # create the package.json file in the .tmp dir
    fs.writeFileSync testPackageJSONPath, fixturePackageJSON
    # init our pkg manager
    pkgManager = new PkgManager({ filePath: testPackageJSONPath })

  afterEach ->
    # remove the package.json from the .tmp dir
    fs.unlinkSync testPackageJSONPath
    # reset our pkg manager
    pkgManager = null

  describe "#constructor", ->

    it "sets the filePath attribute", ->
      newPkgManager = new PkgManager({ filePath: "test" })
      expect(newPkgManager.filePath).to.equal("test")
  
  describe "#loadPackageJSON", ->    

    it "loads the package JSON file", ->
      # load
      pkg = pkgManager.loadPackageJSON()
      # then check the value
      expect(pkg).to.equal(getTestPackageJSON()) 

  describe "#savePackageJSON", ->
    
    it "saves the package JSON file", ->
      # save
      pkgManager.savePackageJSON("test")
      # now load, to check the results
      expect(getTestPackageJSON()).to.equal("test")

  describe "#getVersion", ->

    it "gets the version", ->
      version = JSON.parse(getTestPackageJSON()).version
      expect(pkgManager.getVersion()).to.equal(version)

  describe "#setVersion", ->

    it "updates the version", ->
      pkgManager.setVersion("test")
      version = JSON.parse(getTestPackageJSON()).version
      expect(version).to.equal("test")