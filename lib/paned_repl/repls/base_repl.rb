class PanedRepl::Repls::BaseRepl

  def self.start(name)
    new(name: name).start
  end

  Sessions = {}

  include PanedRepl::Tmux

  attr_reader :name, :pane

  include AutoInitializer

  def start
    @pane = 0
    Sessions[name] = self
    PanedRepl.class_exec { Pry.start }
  end

end
