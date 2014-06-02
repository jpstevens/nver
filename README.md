# nver

Command-line version control tool (semver) for node packages

## Example Usage:

### Increment patch version (default):

```bash
nver
> Patch version incremented to 0.0.2 (was 0.0.1)
```

Or:

```bash
nver --patch
> Patch version incremented to 0.0.3 (was 0.0.2)
```

Or, if you want to be SUPER explicit:

```bash
nver up --patch
> Patch version incremented to 0.0.3 (was 0.0.2)
```

When calling the ```nver``` command, it will assume you want to go up, and assume you want to go up at the patch-level, as this is the most common use case when changing semantic versions.

### Increment minor version:

To increment a minor version, simply use:

```bash
nver --minor
> Patch version incremented to 0.1.3 (was 0.0.3)
```

And to increment a major version, use:

### Increment major version:
```bash
nver --major
> Patch version incremented to 1.1.3 (was 0.1.3)
```

### Decrementing version:

It's easy to decrement versions too, should you need to. 

To decrement the patch version of your node module, use:

```bash
nver down
> Patch version incremented to 1.1.2 (was 1.1.3)
```

If you want to decrement a non-patch version, simple pass the ```major``` or ```minor``` flag along with the ```down``` flag:

```bash
nver down --major
> Patch version incremented to 0.1.2 (was 1.1.2)
```

### Display current version:

To find out what the current version of your node module is, enter:

```bash
nver current
> 0.0.1
```

To find out what the current version of your node module is, enter:

```bash
nver current
> Undefined
```