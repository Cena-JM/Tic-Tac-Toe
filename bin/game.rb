require_relative './../lib/board'
require_relative './../lib/user_interface.rb'
require_relative './../lib/player.rb'
require_relative './../lib/controls.rb'

game = UserInterface.new
controls = Controls.new
board = Board.new

begin
  player1 = game.enter_name(1)
  player2 = game.enter_name(2)

  players = controls.create_player(player1, player2)

  until controls.over

    players.each do |player|
      play = controls.make_play(player.name)

      if board.valid_move?(play)
        player.moves << play
        board.board_update(play, player.symbol)
        game.display(board.board)

        if player.moves.length > 2 && controls.win?(player.moves)
          puts "#{player.name} is the winner"
          player.winner = true
        end

        if player.winner
          controls.over = true
          break
        elsif !player.winner && board.count_moves == 9
          puts "It's a draw!"
          controls.over = true
          break
        end

      else
        redo
      end
    end
  end
rescue StandardError => exception
  controls.error(exception)
  retry
end
