# nver

[![Build Status](https://secure.travis-ci.org/jpstevens/nver.png?branch=master)](https://travis-ci.org/jpstevens/nver)
![Downloads/month](http://img.shields.io/npm/dm/nver.svg)

Command-line version control tool (semver) for node packages

## Installation

As always, run:

```
npm install nver -g
```

## Example Usage

### Increment patch version (default):

To increment the patch level of your node package, simly enter ```nver```:

```bash
nver
> Patch version incremented to 0.0.2 (was 0.0.1)
```

Or ```nver --patch```:

```bash
nver --patch
> Patch version incremented to 0.0.3 (was 0.0.2)
```

Or, if you want to be SUPER explicit, enter ```nver up --patch```:

```bash
nver up --patch
> Patch version incremented to 0.0.3 (was 0.0.2)
```

When calling the ```nver``` command, it will assume you want to go up, and assume you want to go up at the patch-level, as this is the most common use case when changing semantic versions.

### Increment minor or major version:

To increment a minor version, simply enter ```nver --minor```:

```bash
nver --minor
> Minor version incremented to 0.1.0 (was 0.0.3)
```

And to increment a major version, enter ```nver --major```:

```bash
nver --major
> Major version incremented to 1.0.0 (was 0.1.3)
```

### Decrementing version:

It's easy to decrement versions too, should you need to. 

To decrement the patch version of your node package, enter ```nver down```:

```bash
nver down
> Patch version decremented to 1.1.2 (was 1.1.3)
```

If you want to decrement a non-patch version, simple pass the ```--major``` or ```--minor``` flag along with the ```down``` command:

```bash
nver down --major
> Major version decremented to 0.1.2 (was 1.1.2)
```

### Display current version:

To find out what the current version of your node package is, enter ```nver current```:

```bash
nver current
> 0.0.1
```

If the version is not yet set, you'll see an error message:

```bash
nver current
> Error: No version defined!
```

No need to panic; you can set the version using ```nver init```:

```bash
nver init
> Package version initialized to 0.0.1
```

## Testing

This package is tested using Mocha (with Chai). To run the tests, use:

```
npm test
```

Which runs the ``` grunt test ``` command.

If you'd just like to run a particular set of tests (e.g. unit, feature), run:

```
grunt test:unit
```

Or:

```
grunt test:feature
```

These tests are designed to be idempotent. Moreover, each time they are run they will:
- build the app
- run the tests
- tear down the build (once tests have been completed)

## Development

If you'd like to build the package yourself, you can run the ``` grunt build ``` command. This will create a ```/dist``` directory with the build source files, and create a ```/dist/bin``` dir, which contains the binary wrapper for running the nver-cli.

To find out more about the build process, please take a look at the Gruntfile.
