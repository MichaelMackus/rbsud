require 'curses'

class Input
  attr_reader :history

  def initialize
    @history = []
  end

  def gets
    @history.push(Curses.getch).last
  end
end
