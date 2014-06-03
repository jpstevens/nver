(function() {
  var fs, getVersion, loadPackageJSON, path, savePackageJSON, updateVersion;

  fs = require("fs");

  path = require("path");

  loadPackageJSON = function() {
    var filePath;
    filePath = path.resolve(".", "package.json");
    return fs.readFileSync(filePath, "utf-8");
  };

  savePackageJSON = function(json) {
    var filePath;
    filePath = path.resolve(".", "package.json");
    return fs.writeFileSync(filePath, json, "utf-8");
  };

  getVersion = function() {
    return JSON.parse(loadPackageJSON()).version;
  };

  updateVersion = function(ver) {
    var pkg;
    pkg = JSON.parse(loadPackageJSON());
    pkg.version = ver;
    return savePackageJSON(JSON.stringify(pkg, void 0, 2));
  };

  module.exports = {
    loadPackageJSON: loadPackageJSON,
    getVersion: getVersion,
    updateVersion: updateVersion,
    savePackageJSON: savePackageJSON
  };

}).call(this);
