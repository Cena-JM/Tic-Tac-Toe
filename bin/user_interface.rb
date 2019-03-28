# Tic Tac Toe game
class TicTacToe
  INFO = <<Doc.freeze
  *******************************************************************
                    Tic-Tac-Toe game in Ruby Language
                                Authors:
                          Musa Jabbaaru Ntege
                              Zeha Irawan
  *******************************************************************
Doc
  attr_accessor :positions_with_values
  attr_accessor :wins
  attr_accessor :board
  def initialize
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
             [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_info
    puts INFO
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

  def display(board)
    # @pos = positions_with_values
    puts @grid = "
        #{board[0]}|#{board[1]}|#{board[2]}
        -----
        #{board[3]}|#{board[4]}|#{board[5]}
        -----
        #{board[6]}|#{board[7]}|#{board[8]}\n\n"
  end
end
