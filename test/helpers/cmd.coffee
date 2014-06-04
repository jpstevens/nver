fs     = require "fs"
path   = require "path"
exec   = require("child_process").exec

tmpDir = path.resolve __dirname, "..", ".tmp"

fixturePackageJSONPath = path.resolve __dirname, "..", "fixtures", "package.json"  
fixturePackageJSON     = fs.readFileSync fixturePackageJSONPath, "utf-8"
testPackageJSONPath    = path.resolve tmpDir, "package.json"

exports.exec = (cmd, callback) -> 
  # create the package.json file in the .tmp dir
  fs.writeFileSync testPackageJSONPath, fixturePackageJSON
  # execute the command
  exec "cd test/.tmp && ../../dist/bin/#{cmd}"
    , (error, stdout, stderr) ->
      console.log error if error 
      # remove the package.json from the .tmp dir
      fs.unlinkSync testPackageJSONPath
      # callback
      callback error, stdout, stderr