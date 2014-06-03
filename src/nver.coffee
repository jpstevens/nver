levels = ["major", "minor", "patch"]

getVersionObject = (ver) ->
  verArray = ver.match(/([\d]+)\.([\d]+)\.([\d]+)/)
  verObj =
    major: parseInt(verArray[1])
    minor: parseInt(verArray[2])
    patch: parseInt(verArray[3])
    vPrefix: (ver.indexOf("v") >= 0)

getVersionString = (verObj) ->
  verString = "#{verObj.major}.#{verObj.minor}.#{verObj.patch}"
  ( verString = "v#{verString}" ) if verObj.vPrefix
  verString

changeVersion = (ver, config = {}) ->
  # verify level is valid
  if levels.indexOf(config.level) < 0
    throw Error "Level must be major, minor or patch"
  # init the version object
  verObj = getVersionObject ver
  # check if there is an error
  if (verObj[config.level] + config.increment) < 0
    throw Error "Version cannot be decremented below 0.0.0"
  # increment version level
  verObj[config.level] += config.increment
  # return string
  getVersionString verObj

exports.increment = (ver, level = "patch") ->
  changeVersion ver, { increment: 1, level: level }

exports.decrement = (ver, level = "patch") ->
  changeVersion ver, { increment: -1, level: level }
