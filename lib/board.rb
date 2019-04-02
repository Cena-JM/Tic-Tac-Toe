# Board of the game
# Board has board, board_update, available_positions
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def board_update(player_input, symbol)
    @board[player_input.to_i - 1] = symbol
  end

  def available_positions(move)
    @board.to_set.include?(move)
  end
end
