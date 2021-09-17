class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
        Array.new(num) {Array.new(0)}
    end

    attr_reader :max_height

    def initialize(num_stacks, max_height)
        @max_height = max_height
        @num_stacks = num_stacks
        @stacks = Board.build_stacks(num_stacks)
        raise "rows and cols must be >= 4" if num_stacks < 4 || max_height < 4
    end

    def add(token, index)
        if @stacks[index].length < @max_height
            @stacks[index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.any? {|stack| stack.count(token) == @max_height}
    end

    def horizontal_winner?(token)
        
        @stacks[0].each_index do |i|
            count = 0
            (0...@num_stacks).each do |num|
                count += 1 if @stacks[num][i] == token
            end
            return true if count == @num_stacks
        end

        return false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end


end
