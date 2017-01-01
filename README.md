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
# There is a root session automatically created, and creating more sessions isn't implemented

# the 'main pane' receives tmux commands
session = PanelRepl.sessions.values.first

# create a new pane, but maintain focus on main frame
session.split_horizontal

# make the panes equal size, and swap positions so the main pane is always last
session.even_horizontal

new_pane_id = 0 # There are 1 total panes, and the main pane is always the last
                # Therefore the new pane has an id of 0.
                # If a third pane were added, it would have an id of 1 and the main
                # pane would have an id of 2.

session.send_keys "echo hello", new_pane_id
```

There is intended to be one pane that handles direct user input. The other panes just receive commands through `send_keys`.

See [./lib/paned_repl/tmux.rb](lib/paned_repl/tmux.rb) for more commands that can be used. 
