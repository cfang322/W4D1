class KnightPathFinder

    def self.valid_moves(position) #[3, 3]
        x, y = position
        possible_moves = [
            [x + 2, y + 1],
            [x - 2, y + 1],
            [x + 2, y - 1],
            [x - 2, y - 1],
            [x + 1, y + 2],
            [x - 1, y + 2],
            [x + 1, y - 2],
            [x - 1, y - 2]
        ]
        # define list of all possible moves within the board
        valid_moves = possible_moves.select do |move|
            move.all? { |coord| coord >= 0 && coord < 8 }
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
        valid_moves = KnightPathFinder.valid_moves(position)
        new_positions = valid_moves.reject { |pos| @considered_positions.include?(pos) }
        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree(start_pos, n = nil)
        root = PolyTreeNode.new(@start_position)
        queue = [root]

        until queue.empty?
        current_node = queue.shift
        current_pos = current_node.value

        new_move_positions(current_pos).each do |new_pos|
            child_node = PolyTreeNode.new(new_pos)
            current_node.add_child(child_node)
            queue << child_node
        end

        root
    end
    #     (x, y) = start_pos
    #     start_pos = [x][y]
    #     valid_moves = []
    #     queue = deque()

    #     for dx, dy in possible_moves
    #         new_x, new_y = x + dx, y + dy
    #         if self.is_valid(new_x, new_y)
    #             queue.push(new_x, new_y)
    #             valid_moves.push(new_x, new_y)
    #         end
    #     end
    #     return valid_moves
    # end 

end 
#     def build_move_tree(start_position, n = nil) #BFS
#         @considered_positions = [@start_position] #[0,0]
#         result = []
#         #if queue is not empty AND if queue does not already contain a position
#         if !@considered_positions.empty? && !@considered_positions.include?(@position)
#             @considered_positions.pop(@start_position)
#             children 
#             @considered_positions << @position.children
#         end
#     end
    
# end 

# [0, 0] <= starting position in que
# |      \
# [1,2]  [2,1] 
# turn ^ into nodes and add to que

