# Board of the game
# Board has board, board_update, available_positions
#           valid_move and count_moves methods
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

  def valid_move?(move)
    if !move.between?(1, 9)
      puts 'Please Select Position Between 1-9!'
      false
    elsif !available_positions(move)
      puts 'Please Select Unoccupied!'
      false
    else
      true
    end
  end

  def count_moves
    count = 0
    @board.each do |move|
      count += 1 if [move].include?('X') || [move].include?('O')
    end
    count
  end
end
