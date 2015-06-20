class Room
    attr_reader :text, :exits

    @@summary = 'a room'

    def self.summary
        @@summary
    end

    def to_s
        s = @text

        if not exits.empty?
            s += "\n" * 5
            s += exit_text
        end

        s
    end

    def exit_text
        @exits.map { |exit, room|
            case exit
            when :n
                text = '(n)orth'
            when :e
                text = '(e)ast'
            when :s
                text = '(s)outh'
            when :w
                text = '(w)est'
            when :f
                text = '(f)orward'
            when :b
                text = '(b)ack'
            else
                text = exit.to_s
            end

            if room.is_a? Enumerable
                room = room[0]
            end

            text += ' to ' + room.summary
        }.join("\n")
    end

    def on_render
        if not defined? @entered
            @entered = true
            on_enter
        end
    end

    def on_enter
        # do something
    end
end
