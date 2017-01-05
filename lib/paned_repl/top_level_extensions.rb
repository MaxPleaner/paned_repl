require 'byebug'
require 'securerandom'
require 'easy_cache'
require 'awesome_print'
require 'faye/websocket'
require 'eventmachine'
require 'keyword_hash_builder'

$debug = true
Thread.abort_on_exception = true

module TopLevelExtensions

  def exit_tmux
    panes.data.values.sort.reverse.each &base.method(:kill_pane)
    `pkill tmux`
    exit
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
