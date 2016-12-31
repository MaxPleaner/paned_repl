module PanedRepl::Tmux

  def split(direction, *args)
    send(:"split_#{direction}", *args)
  end

  def select_pane(n)
    `tmux select-pane -t #{n}`
  end

  def split_horizontal
    system "tmux split-window -v -t #{name}"
    select_pane(0)
  end

  def split_vertical
    system "tmux split-window -v -t #{name}"
    select_pane(0)
  end

  def swap_pane(n1,n2)
    system "tmux swap-pane -s #{n1} -t #{n2}"
    select_pane(n2)
  end

  def kill_pane(n)
    `tmux kill-pane -t #{n}`
  end

  def send_keys(keys)
    system <<-SH
      tmux send-keys \
        -t #{name} \
        "#{keys}" \
        C-m
    SH
  end

  def attach
    system "tmux attach -t #{name}"
  end

  def even_vertical
    system "tmux select-layout -t #{name} even-vertical"
  end

  def even_horizontal
    system "tmux select-layout -t #{name} even-horizontal"
  end

  def tiled
    system "tmux select-layout -t #{name} tiled"
  end

end
