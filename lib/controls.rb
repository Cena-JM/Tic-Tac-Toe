require 'set'
require_relative './player.rb'

# Controls has winning sets
# Controls has over, create_player, make_play, wina and error methods
class Controls
  attr_accessor :over

  def initialize
    @over = false
    @wins = [Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9], Set[1, 4, 7],
             Set[1, 5, 9], Set[2, 5, 8], Set[3, 5, 7],
             Set[3, 6, 9]].freeze.freeze
  end

  def create_player(player1, player2)
    [Player.new(player1, 'X', false), Player.new(player2, 'O', false)]
  end

  def make_play(name)
    puts "#{name}, make your play by entering " \
            'corresponding number 1 to 9: '
    gets.chomp.to_i
  end

  def win?(moves)
    status = false
    @wins.each do |draft|
      next unless draft.subset?(moves.to_set)
      status = true
      break
    end
    status
  end

  def error(error)
    puts "Error: #{error}"
  end
end
