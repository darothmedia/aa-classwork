class Board
    def self.build_stacks(num)
        @stacks = Array.new(num) {Array.new(0)}
    end

    attr_reader :max_height, :num

    def initialize(num, max_height)
        @max_height = max_height
        @num = num
        @stacks = Board.build_stacks(num)
        raise "rows and cols must be >= 4" if num < 4 || @max_height < 4
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
        @stacks.each do |stack|
            count = 0
            stack.each do |el|
                count += 1 if el == token
            end
            if count == @max_height
                return true
            end
        end
        return false
    end

#### THIS IS WHAT YOU NEED TO WORK ON #####
    def horizontal_winner?(token)
        hash = Hash.new(0)
        @stacks.each.with_index do |stack, i|
            stack.each.with_index do |el, i2|
                hash[i2] += 1 if el == token
            end
        end
       if hash.has_value?(@num)
        return true
       else
        return false
       end
    end


    def winner?(token)
        if self.vertical_winner?(token) || self.horizontal_winner?(token)
            return true
        else
            return false
        end
    end



    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
