(function() {
  var changeVersion, getVersionObject, getVersionString, levels;

  levels = ["major", "minor", "patch"];

  getVersionObject = function(ver) {
    var verArray, verObj;
    verArray = ver.match(/([\d]+)\.([\d]+)\.([\d]+)/);
    return verObj = {
      major: parseInt(verArray[1]),
      minor: parseInt(verArray[2]),
      patch: parseInt(verArray[3]),
      vPrefix: ver.indexOf("v") >= 0
    };
  };

  getVersionString = function(verObj) {
    var verString;
    verString = "" + verObj.major + "." + verObj.minor + "." + verObj.patch;
    if (verObj.vPrefix) {
      verString = "v" + verString;
    }
    return verString;
  };

  changeVersion = function(ver, config) {
    var verObj;
    if (config == null) {
      config = {};
    }
    if (levels.indexOf(config.level) < 0) {
      throw Error("Level must be major, minor or patch");
    }
    verObj = getVersionObject(ver);
    if ((verObj[config.level] + config.increment) < 0) {
      throw Error("Version cannot be decremented below 0.0.0");
    }
    verObj[config.level] += config.increment;
    return getVersionString(verObj);
  };

  exports.increment = function(ver, level) {
    if (level == null) {
      level = "patch";
    }
    return changeVersion(ver, {
      increment: 1,
      level: level
    });
  };

  exports.decrement = function(ver, level) {
    if (level == null) {
      level = "patch";
    }
    return changeVersion(ver, {
      increment: -1,
      level: level
    });
  };

}).call(this);
