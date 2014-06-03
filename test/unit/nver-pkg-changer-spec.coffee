expect = require("chai").expect
fs   = require "fs"
path = require "path"
PkgManager = require "../../src/pkg-manager"

describe "nverPkgChanger", ->

  pkgManager = null

  tmpDir = path.resolve __dirname, "..", ".tmp"
  testPackageJSONPath = path.resolve tmpDir, "package.json"
  getTestPackageJSON = -> fs.readFileSync testPackageJSONPath, 'utf-8'

  fixturePackageJSONPath = path.resolve __dirname, "..", "fixtures", "package.json"  
  fixturePackageJSON = fs.readFileSync fixturePackageJSONPath, 'utf-8'

  beforeEach ->
    # make the dir 
    fs.mkdirSync tmpDir
    # create the package.json file in the .tmp dir
    fs.writeFileSync testPackageJSONPath, fixturePackageJSON
    # init our pkg manager
    pkgManager = new PkgManager({ filePath: testPackageJSONPath })

  afterEach ->
    # remove the package.json from the .tmp dir
    fs.unlinkSync testPackageJSONPath
    # remove the dir 
    fs.rmdirSync tmpDir
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