class KnightPathFinder

    def self.valid_moves(position) #[3, 3]
        possible_moves = []
        x, y = position
        possible_moves.push(
            [x + 2, y + 1],
            [x - 2, y + 1],
            [x + 2, y - 1],
            [x - 2, y - 1],
            [x + 1, y + 2],
            [x - 1, y + 2],
            [x + 1, y - 2],
            [x - 1, y - 2]
        ) 
        if @board(position)
            return true
        else
            return false
        end
    end

    def initialize(start_position)
        #where it start
        @start_position = start_position
        #8 by 8 board with each space as unique []
        @board = Array.new(8) { Array.new(8) {[]} }
        #all possible moves for knight 
        @considered_positions = [@start_position]
    end 

    def new_move_positions(position)
        kpf = KnightPathFinder.valid_moves(position)
        if !@considered_positions.include?(position)
            @considered_positions << position
        end
    end

    def build_move_tree(start_position)
        
    end
end 