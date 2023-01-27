# d
d is a wrapper around dictd and gtranslate for lightning fast dictionary querying from the terminal


### If you have nix (the package manager) installed:

```bash
chmod +x ./d

d define a priori
d eng spa to preen
```

### Use without nix

The only dependency is ruby. Just replace the shebang on top of the script, as it has a special `nix-shell` shebang baked in.

Delete the first two lines and replace it with:

```bash
#!/usr/bin/env ruby
```

Then:

```bash
chmod +x ./d

d eng tur love
d thesaurus contextual
```
