# d
d is a wrapper around dictd and gtranslate for lightning fast dictionary querying from the terminal


### Usage

Dependencies: ruby3, [translate-shell](https://github.com/soimort/translate-shell), dict

You can install dict from most package managers, e.g. `brew install dict`. Both `gtranslate` and `dict` must be in your $PATH, otherwise set `D_GTRANSLATE_BIN_PATH` and `D_DICT_BIN_PATH` environment variables.

```bash
chmod +x ./d

d eng tur love
d thesaurus contextual
```

#### Basic english only usage:

```
d define glee club
d thesaurus medium
d acronym LISA
```

See the `dictd_mode_command` function below for the supported
modes; it's easy to add any that dictd supports.


You can quickly translate language to language as well:

```
d eng hun to preen
d eng tur beautiful
d eng spa seaside
```

Run `dictd -D` for a list of available language pairs.
