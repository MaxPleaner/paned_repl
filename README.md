**Installation**

To launch a REPL (using Pry), first do this in Bash:

```sh
gem install paned_repl
paned_repl init
sh paned_repl.sh
```
**Usage**

inside the REPL, require whatever programs you need.

There is a Ruby wrapper over TMux commands. For example:

```rb
# the 'main pane' receives tmux commands
# this refers to a root Tmux session that is automatically created.
# launching subsequent Tmux sessions is not implemented
session = PanelRepl.sessions.values.first

# create a new pane, but maintain focus on main frame.
# swaps positions so the main pane is always last
session.split_horizontal

# make the panes equal size
session.even_horizontal

new_pane_id = 0 # There are 2 total panes, and the main pane is always the last
                # Therefore (with 0-indexing) the new pane has an id of 0.
                # When a new pane is added, it always has the index of 0 and all other indexes
                # need to be incremented by one..

session.send_keys "echo hello", new_pane_id
```

There is intended to be one pane that handles direct user input. The other panes just receive commands through `send_keys`.

See [./lib/paned_repl/tmux.rb](lib/paned_repl/tmux.rb) for more commands that can be used. 

The generated `paned_repl.sh` script can be customized to run commands when the repl begins.

Gif:

[![asciicast](https://asciinema.org/a/0j2kffw5oj66hf6u08hnx7872.png)](https://asciinema.org/a/0j2kffw5oj66hf6u08hnx7872)
