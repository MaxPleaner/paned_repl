require 'gemmy'
module PanedRepl
end
Gem.find_files("paned_repl/**/*.rb").each &method(:require)
