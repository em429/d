# d
d is a wrapper around dictd and gtranslate for lightning fast dictionary querying from the terminal


### If you have nix (the package manager) installed:

All dependencies are set using nix-shell in the script shebang, so you can just run it:

```bash
chmod +x ./d

d define a priori
d eng spa to preen
```

### Use without nix

Dependencies: ruby, [translate-shell](https://github.com/soimort/translate-shell), dictd.

Just replace the shebang on top of the script, as it has a special `nix-shell` shebang baked in.

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
