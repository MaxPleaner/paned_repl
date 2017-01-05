$debug = true
Thread.abort_on_exception = true

module TopLevelExtensions

  def exit_tmux(pane_count=0)
    pane_count.times { base.kill_pane(0) }
    `pkill tmux`
  end

  def to_shell_command(ruby_string)
    if ["\"", "\'"].any? &cmd_fragment.method(:include?)
      raise ArgumentError, "fragment cant have quotes"
    end
    <<-SH
    ruby -e '#{cmd_fragment}'
    SH
  end

end
