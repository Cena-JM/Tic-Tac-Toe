require_relative './../lib/board'
require_relative './../lib/user_interface.rb'
require_relative './../lib/player.rb'
require_relative './../lib/controls.rb'

game = UserInterface.new
controls = Controls.new(game.enter_name(1), game.enter_name(2))
board = Board.new

begin
  players = [Player.new(controls.player1, 'X', false),
             Player.new(controls.player2, 'O', false)]

  count = 0
  until controls.over

    players.each do |player|
      play = controls.make_play(player.name)

      if !play.between?(1, 9)
        puts 'Please Select Position Between 1-9!'
        redo
      elsif !board.available_positions(play)
        puts 'Please Select Unoccupied!'
        redo
      else
        player.moves << play
        board.board_update(play, player.symbol)
        game.display(board.board)

        if player.moves.length > 2 && controls.win?(player.moves)
          puts "#{player.name} is the winner"
          player.winner = true
        end

        count += 1

        if player.winner
          controls.over = true
          break
        elsif !player.winner && count == 9
          puts "It's a draw!"
          controls.over = true
          break
        end
      end
    end
  end
rescue StandardError => exception
  controls.error(exception)
  retry
end
