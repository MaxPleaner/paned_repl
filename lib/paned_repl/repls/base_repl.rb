class PanedRepl::Repls::BaseRepl

  def self.start(name="test")
    new(name: name).start
  end

  Instances = {}

  include PanedRepl::Tmux

  attr_reader :name, :pane

  include AutoInitializer

  def start
    @pane = 0
    Instances[name] = self
    PanedRepl.class_exec { Pry.start }
  end

end
