# Tic Tac Toe game
class TicTacToe
  attr_accessor :info, :positions_with_values
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  def initialize
    @positions_with_values = { '1' => ' ', '2' => ' ', '3' => ' ',
                               '4' => ' ', '5' => ' ', '6' => ' ',
                               '7' => ' ', '8' => ' ', '9' => ' ' }
  end

  def display_positions
    puts ''
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '
    puts ''
  end

  def display
    @pos = positions_with_values
    puts @grid = "
      #{@pos[1]}|#{@pos[2]}|#{@pos[3]}
      -----
      #{@pos[4]}|#{@pos[5]}|#{@pos[6]}
      -----
      #{@pos[7]}|#{@pos[8]}|#{@pos[9]}"
  end
end
