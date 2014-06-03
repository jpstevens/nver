(function() {
  var PkgManager, fs, path;

  fs = require("fs");

  path = require("path");

  PkgManager = (function() {
    function PkgManager(config) {
      this.filePath = config.filePath;
    }

    PkgManager.prototype.loadPackageJSON = function() {
      return fs.readFileSync(this.filePath, "utf-8");
    };

    PkgManager.prototype.savePackageJSON = function(json) {
      return fs.writeFileSync(this.filePath, json, "utf-8");
    };

    PkgManager.prototype.getVersion = function() {
      return JSON.parse(this.loadPackageJSON()).version;
    };

    PkgManager.prototype.setVersion = function(ver) {
      var pkg;
      pkg = JSON.parse(this.loadPackageJSON());
      pkg.version = ver;
      return this.savePackageJSON(JSON.stringify(pkg, void 0, 2));
    };

    return PkgManager;

  })();

  module.exports = PkgManager;

}).call(this);
