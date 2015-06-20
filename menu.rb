class Menu
  def initialize(game)
    @game = game

    while @game.state == :menu
      draw
      handle gets
    end
  end

  def draw
    system "clear"

    puts "     Sample Menu"
    puts "     (p to play or q to quit)"
  end

  def handle(input)
    case input.strip
    when 'p'
      @game.state = :play
    when 'q'
      throw :quit
    end
  end
end
