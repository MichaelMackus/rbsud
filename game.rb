require './menu.rb'
require './world.rb'
require './renderer.rb'
require './input.rb'

require 'curses'

class Game
    attr_accessor :state

    def initialize
        @input = Input.new

        @state = :play
        catch :quit do
            init

            # main game loop
            while true
                @renderer.draw @world.to_s
                @renderer.refresh

                @world.do(@input.gets.to_sym)
            end
        end

        quit
    end

    def init
        @renderer = CursesRenderer.new
        @console = ConsoleRenderer.new
        @world = World.new
    end

    def quit
        @renderer.close
        @console.draw @world.to_s
        @console.draw "What you've done: " + @input.history.join(', ')
        @console.refresh
    end
end

Game.new
