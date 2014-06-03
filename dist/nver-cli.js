(function() {
  var PkgManager, capitalize, fs, getLevel, getMethod, level, method, newVer, nver, opt, path, pkgManager, ver;

  fs = require("fs");

  path = require("path");

  nver = require("./nver");

  PkgManager = require("./pkg-manager");

  capitalize = require("capitalize");

  opt = require("node-getopt").create([["", "up", "increment "], ["", "down", "long option."], ["", "patch", "long option."], ["", "minor", "mino"], ["", "major", "mino"], ["h", "help", "display this help"], ["v", "version", "show version"]]).parseSystem();

  pkgManager = new PkgManager({
    filePath: path.resolve(".", "package.json")
  });

  getMethod = function(args) {
    if (args.length === 0) {
      return "increment";
    }
    if (args.length === 1) {
      switch (args[0]) {
        case "up":
          return "increment";
        case "down":
          return "decrement";
        case "init":
          return "init";
        case "current":
          return "current";
        default:
          throw Error("Invalid option: " + args[0]);
      }
    } else {
      throw Error("Invalid command: " + (args.join(' ')));
    }
  };

  getLevel = function(options) {
    var count, level, option, value;
    count = 0;
    for (option in options) {
      value = options[option];
      count++;
      if (!level) {
        level = option;
      }
    }
    if (count > 1) {
      return new Error("Only one version level can be updated at a time");
    }
    if (count === 1) {
      return level;
    }
    return "patch";
  };

  method = getMethod(opt.argv);

  level = getLevel(opt.options);

  ver = pkgManager.getVersion();

  if (["increment", "decrement"].indexOf(method) >= 0) {
    pkgManager.setVersion(nver[method](ver, level));
    newVer = pkgManager.getVersion();
    console.log("" + (capitalize(level)) + " version " + method + "ed to " + newVer + " (was " + ver + ")");
  } else if (method === "current") {
    console.log(pkgManager.getVersion());
  } else if (method === "init") {
    pkgManager.setVersion("0.0.0");
    newVer = pkgManager.getVersion();
    console.log("Patch version initialized to " + newVer);
  }

}).call(this);
