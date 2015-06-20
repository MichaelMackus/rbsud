require 'curses'

class CursesRenderer
  MAX_WIDTH = 80
  MAX_HEIGHT = 24

  def initialize
    Curses.noecho
    Curses.init_screen
    reset_pos
  end

  def reset_pos
    @pos = 5, 5
  end

  def draw(str)
    Curses.setpos(@pos[0], @pos[1])
    Curses.addstr(str)

    @pos[0] += 1
  end

  def refresh
    Curses.addstr("\n" * MAX_HEIGHT)
    Curses.setpos(MAX_HEIGHT - 2, 5)
    Curses.refresh
    reset_pos
  end

  def close
    Curses.close_screen
  end
end

class ConsoleRenderer
  def initialize
    @text = ''
  end

  def draw(str)
    @text += str
    @text += "\n" * 2
  end

  def refresh
    system "clear"
    puts "\n"
    puts @text
  end
end
