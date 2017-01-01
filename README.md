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
session = PanelRepl.sessions.values.first

session.split_horizontal
session.even_horizontal
session.select_pane(0)
session.send_keys "echo hello"
```

There is intended to be one pane that handles direct user input. The other panes just receice commands through `send_keys`.

See [./lib/paned_repl/tmux.rb](lib/paned_repl/tmux.rb) for more commands that can be used. 
