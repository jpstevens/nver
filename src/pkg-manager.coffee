fs   = require "fs"
path = require "path"

class PkgManager

  constructor: (config) ->
    @filePath = config.filePath

  loadPackageJSON: ->
    fs.readFileSync @filePath, "utf-8"
    # if no JSON, return an error

  savePackageJSON: (json) ->
    fs.writeFileSync @filePath, json, "utf-8"
    # if no JSON, return an error

  getVersion: ->
    JSON.parse(@loadPackageJSON()).version

  setVersion: (ver) ->
    pkg = JSON.parse(@loadPackageJSON())
    pkg.version = ver
    @savePackageJSON JSON.stringify(pkg, undefined, 2)

module.exports = PkgManager