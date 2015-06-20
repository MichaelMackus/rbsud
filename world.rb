require './rooms.rb'

class World
    attr_reader :history

    def initialize
        @room = Start.new
        @history = []
    end

    def to_s
        @room.to_s
    end

    def do(action)
        if action == :q
            throw :quit
        end

        # change room?
        if @room.exits.has_key? action
            go(@room.exits[action])
        end
    end

    private

    def go(r)
        if r.is_a? Enumerable
            get_next_room(r)
        end

        raise "World.go requires a Room" unless r.is_a? Room.class

        @room = r.new
        @room.on_enter
        @history.push @room
    end

    # enemerates over room history to find next room
    def get_next_room(r)
        i = 0

        # count previous r's visited, todo fixme
        @history.reverse_each do |h|
            if h.class != r[0]
                break
            end

            i += 1
        end

        if i >= r.count
            throw :quit # todo modify methods
        end

        r = r[i]
    end
end
