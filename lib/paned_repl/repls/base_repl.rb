class PanedRepl::Repls::BaseRepl

  def self.start(name, &blk)
    new(name: name).start(&blk)
  end

  Sessions = {}

  include PanedRepl::Tmux

  attr_reader :name, :pane

  include AutoInitializer

  def start(&blk)
    Object.include TopLevelExtensions
    Sessions[name] = self
    Thread.new(&blk) if blk
    PanedRepl.class_exec { Pry.start }
  end

end
