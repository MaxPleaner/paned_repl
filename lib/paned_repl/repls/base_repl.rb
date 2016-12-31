class PanedRepl::Repls::BaseRepl

  def self.start(name="test")
    new(name: name).start
  end

  Instances = {}

  include PanedRepl::Tmux

  attr_reader :name

  include AutoInitializer

  def start
    Instances[name] = self
    PanedRepl.class_exec { Pry.start }
  end

end
