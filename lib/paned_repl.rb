require 'gemmy'

module PanedRepl
  def self.start
    Repls::BaseRepl.start
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
