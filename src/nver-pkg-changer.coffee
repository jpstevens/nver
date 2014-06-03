fs   = require "fs"
path = require "path"



loadPackageJSON = ->
  filePath = path.resolve ".", "package.json"
  fs.readFileSync filePath, "utf-8"
  # if no JSON, return an error

savePackageJSON = (json) ->
  filePath = path.resolve ".", "package.json"
  fs.writeFileSync filePath, json, "utf-8"
  # if no JSON, return an error

getVersion = ->
  JSON.parse(loadPackageJSON()).version

updateVersion = (ver) ->
  pkg = JSON.parse(loadPackageJSON())
  pkg.version = ver
  savePackageJSON JSON.stringify(pkg, undefined, 2)

module.exports = { loadPackageJSON, getVersion, updateVersion, savePackageJSON }