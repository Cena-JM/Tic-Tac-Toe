require_relative './../lib/engine.rb'
require_relative './../lib/user_interface.rb'
# game running class
class Game
  game = TicTacToe.new
   engine = Engine.new

   board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  game.display_positions
engine.play(board)

end

Game
