require 'gemmy'
require 'auto_initializer'

module PanedRepl

  def self.sessions
    PanedRepl::Repls::BaseRepl::Sessions
  end

  def self.base_session
    sessions["paned_repl_base_tmux_session"]
  end

  def self.start(name, &blk)
    Repls::BaseRepl.start(name, &blk)
  end

  def self.const name
    Constants.const_get name
  end

end


first_dependencies = [
  *Gem.find_files("paned_repl/constants.rb").to_a
].each &method(:require)

all_dependencies = Gem.find_files("paned_repl/**/*.rb").to_a.sort_by do |path|
  path.count "/"
end

(all_dependencies - first_dependencies).each &method(:require)
