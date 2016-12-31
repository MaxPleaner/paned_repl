
#!/bin/bash

BASE_TMUX_SESSION=paned_repl_base_tmux_session

tmux new -s $BASE_TMUX_SESSION -d

tmux send-keys -t $BASE_TMUX_SESSION:0.0 "
  ruby -e '
    require %{paned_repl};
    PanedRepl.start(%{$BASE_TMUX_SESSION});
  '
" C-m

tmux attach -t $BASE_TMUX_SESSION

