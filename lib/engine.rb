# Tic Tac Toe game
class TicTacToe
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
    puts ''
    puts " #{positions_with_values['1']} | #{positions_with_values['2']} | #{positions_with_values['3']} "
    puts '-----------'
    puts " #{positions_with_values['4']} | #{positions_with_values['5']} | #{positions_with_values['6']} "
    puts '-----------'
    puts " #{positions_with_values['7']} | #{positions_with_values['8']} | #{positions_with_values['9']} "
    puts ''
  end
end
