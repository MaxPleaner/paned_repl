module PanedRepl::Tmux

  def setup_tmux
    @main_pane = 0
  end

  def select_pane(n)
    `tmux select-pane -t #{n}`
  end

  def split_vertical(pane_num=nil)
    select_pane(pane_num)
    system "tmux split-window -v"
    if pane_num == @main_pane
      swap_pane @main_pane, @main_pane + 1
    end
    @main_pane = @main_pane + 1
    select_pane(@main_pane)
  end

  def split_horizontal(pane_num=nil)
    pane_num ||= @main_pane
    select_pane(pane_num)
    system "tmux split-window -h"
    if pane_num == @main_pane
      swap_pane @main_pane, @main_pane + 1
    end
    @main_pane = @main_pane + 1
    select_pane(@main_pane)
  end

  def swap_pane(n1,n2)
    system "tmux swap-pane -s #{n1} -t #{n2}"
  end

  def kill_pane(n)
    `tmux kill-pane -t #{n}`
    @main_pane = @main_pane - 1
  end

  def send_keys(keys, frame_id)
    frame_selector = %{ -t #{frame_id} } if frame_id
    system <<-SH
      tmux send-keys #{frame_selector} "#{keys}" C-m
    SH
    select_pane @main_pane
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
