
#!/bin/bash

TMUX_SESSION_NAME=paned_repl_tmux

tmux new -s $TMUX_SESSION_NAME -d

tmux send-keys -t $TMUX_SESSION_NAME:0.0 "
  ruby -e '
    require %{paned_repl};
    PanedRepl.start
  '
" C-m

tmux attach -t $TMUX_SESSION_NAME

