fs   = require "fs"
path = require "path"
nver = require "./nver"
pkgChanger = require "./nver-pkg-changer"
capitalize = require "capitalize"
opt  = require("node-getopt").create([
  ["" , "up", "increment "],
  ["" , "down", "long option." ],
  ["" , "patch", "long option." ],
  ["" , "minor", "mino"],
  ["" , "major", "mino"],
  ["h" , "help", "display this help"],
  ["v" , "version", "show version"]
])             # create Getopt instance
.parseSystem() # parse command line

getMethod = (args) ->
  return "increment" if args.length is 0
  if args.length is 1
    switch args[0]
      when "up" then return "increment"
      when "down" then return "decrement"
      when "init" then return "init"
      when "current" then return "current"
      else throw Error "Invalid option: #{args[0]}"
  else
    throw Error "Invalid command: #{args.join(' ')}"

getLevel = (options) ->
  count = 0
  for option, value of options
    count++
    (level = option) unless level
  return new Error "Only one version level can be updated at a time" if count > 1
  return level if count is 1
  "patch"

method = getMethod(opt.argv)
level = getLevel(opt.options)
ver = pkgChanger.getVersion()

if ["increment", "decrement"].indexOf(method) >= 0
  pkgChanger.updateVersion nver[method](ver, level)
  newVer = pkgChanger.getVersion()
  console.log "#{capitalize(level)} version #{method}ed to #{newVer} (was #{ver})"
else if (method is "current")
  console.log pkgChanger.getVersion()
else if (method is "init")
  pkgChanger.updateVersion "0.0.0"
  newVer = pkgChanger.getVersion()
  console.log "Patch version initialized to #{newVer}"

