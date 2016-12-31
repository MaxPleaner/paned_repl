module PanedRepl::Tmux

  def split(direction, *args)
    send(:"split_#{direction}", *args)
  end

  def select_pane(n)
    `tmux select-pane -t #{n}`
  end

  def split_vertical(pane_num=nil)
    pane_num ||= pane
    select_pane(pane_num)
    system "tmux split-window -v -t #{name}"
    if pane_num = pane
      swap_pane pane, pane + 1
    end
    @pane = pane + 1
    # even_vertical
    select_pane(pane)
  end

  def split_horizontal(pane_num=nil)
    pane_num ||= pane
    select_pane(pane_num)
    system "tmux split-window -h -t #{name}"
    if pane_num == pane
      swap_pane pane, pane + 1
    end
    @pane = pane + 1
    # even_horizontal
    select_pane(pane)
  end

  def swap_pane(n1,n2)
    system "tmux swap-pane -s #{n1} -t #{n2}"
  end

  def kill_pane(n)
    `tmux kill-pane -t #{n}`
  end

  def send_keys(keys, pane_num=nil)
    if pane_num
      select_pane pane_num
    end
    system <<-SH
      tmux send-keys \
        -t #{name} \
        "#{keys}" \
        C-m
    SH
    select_pane pane
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
