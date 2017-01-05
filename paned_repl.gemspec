require_relative './lib/version.rb'
Gem::Specification.new do |s|
  s.name        = "paned_repl"
  s.version     = PanedRepl::VERSION
  s.date        = "2016-12-31"
  s.summary     = "A TMux wrapper for dynamic multiplexing in a REPL"
  s.description = ""
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["maxpleaner"]
  s.email       = 'maxpleaner@gmail.com'
  s.required_ruby_version = '~> 2.3'
  s.homepage    = "https://github.com/maxpleaner/paned_repl"
  s.files       = Dir["lib/**/*.rb", "bin/*", "**/*.md", "LICENSE"]
  s.require_path = 'lib'
  s.required_rubygems_version = ">= 2.5.1"
  s.executables = Dir["bin/*"].map &File.method(:basename)
  s.add_dependency 'gemmyrb'
  s.add_dependency 'auto_initializer'
  s.add_dependency 'colored'
  s.add_dependency 'byebug'
  s.add_dependency 'thor'
  s.add_dependency 'awesome_print'

  s.license     = 'MIT'
end
