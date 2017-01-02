module PanedRepl::Tmux

  def select_pane(n)
    `tmux select-pane -t #{n}`
  end

  def split_vertical(pane_num=nil)
    pane_num ||= pane
    select_pane(pane_num)
    system "tmux split-window -v"
    if pane_num == pane
      swap_pane pane, pane + 1
    end
    @pane = pane + 1
    select_pane(pane)
  end

  def split_horizontal(pane_num=nil)
    pane_num ||= pane
    select_pane(pane_num)
    system "tmux split-window -h"
    if pane_num == pane
      swap_pane pane, pane + 1
    end
    @pane = pane + 1
    select_pane(pane)
  end

  def swap_pane(n1,n2)
    system "tmux swap-pane -s #{n1} -t #{n2}"
  end

  def kill_pane(n)
    `tmux kill-pane -t #{n}`
    @pane = pane - 1
  end

  def send_keys(keys, frame_id)
    frame_selector = %{ -t #{frame_id} } if frame_id
    system <<-SH
      tmux send-keys #{frame_selector} "#{keys}" C-m
    SH
    select_pane pane
  end

  def create_session(session_name=nil)
    session_name ||= name
    system "tmux new -s #{session_name} -d"
  end

  def attach(session_name=nil)
    session_name ||= name
    system "tmux attach -t #{session_name}"
  end

  def even_vertical
    system "tmux select-layout even-vertical"
  end

  def even_horizontal
    system "tmux select-layout even-horizontal"
  end

  def tiled
    system "tmux select-layout tiled"
  end

end
