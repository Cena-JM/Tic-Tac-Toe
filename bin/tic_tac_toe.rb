require_relative './../lib/engine.rb'
require_relative './../lib/user_interface.rb'
# game running class
class Game
  attr_accessor :board
  game = TicTacToe.new
  game.display_info
  game.display_positions
  board = game.board

  engine = Engine.new
  engine.play(board)
end

Game
