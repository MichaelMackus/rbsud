# Text Adventure Engine

I'm using this project to learn ruby. Lots of progress to be made.

# Setup

Create a `rooms.rb` file. Example:

```ruby
require './room.rb'

class Start < Room
    def initialize
        @text = 'O hai'
        @exits = { :f => Next }
    end
end

class Next < Room
    @@summary = 'next room'

    def initialize
        @text = 'Your path has come such a long way'
        @exits = { :f => End }
    end
end

class End < Room
    @@summary = 'an empty, dark void'

    def initialize
        @text = 'The End!'
        @exits = {}
    end

    def on_enter
        throw :quit
    end
end
```
