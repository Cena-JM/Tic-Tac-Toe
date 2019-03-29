require_relative '../bin/user_interface'
require_relative './player.rb'
# Engine is the logical(brians) class of the game
class Engine
  attr_accessor :board
  def initialize
    puts 'Player1 enter your name?'
    @player1 = Player.new(gets.chomp)
    puts 'player2 enter your name?'
    @player2 = Player.new(gets.chomp)
    @player1.symbol = 'X'
    @player2.symbol = 'O'
    @dp = UserInterface.new
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
             [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  end

  def indexing(user_input)
    user_input.to_i - 1
  end

  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(array, index)
    if index < 0 || index > 8 || index.nil?
      puts 'Please Select Box Between 1-9!'
      false
    elsif array[index] == ' ' || array[index] == ''
      true
    else
      puts 'Please Select Unoccupied!'
      false
    end
  end

  def turn(board)
    puts "\n#{@player1.name} enter 1-9" if current_player(board) == @player1.symbol
    puts "#{@player2.name} enter 1-9" if current_player(board) == @player2.symbol
    index = indexing(gets.strip)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      @dp.display(board)
    else
      turn(board)
    end
  end

  def turn_count(array)
    counter = 0
    array.each do |move|
      counter += 1 if move.include?(@player1.symbol) || move.include?(@player2.symbol)
    end
    counter
  end

  def current_player(board)
    turn_count(board).even? == true ? @player1.symbol : @player2.symbol
  end

  def win?(board)
    @wins.each do |win_combo|
      p_a = board[win_combo[0]]
      p_b = board[win_combo[1]]
      p_c = board[win_combo[2]]
      return win_combo if test(board) ||
                          (p_a == @player2.symbol && p_b == @player2.symbol && p_c == @player2.symbol)
    end
    nil
  end

  def test(board)
    @wins.each do |win_combo|
      p_a = board[win_combo[0]]
      p_b = board[win_combo[1]]
      p_c = board[win_combo[2]]
      return true if p_a == @player1.symbol && p_b == @player1.symbol && p_c == @player1.symbol
    end
    false
  end

  def full?(array)
    count = 0
    array.each do |move|
      count += 1 if move.include?(@player1.symbol) || move.include?(@player2.symbol)
    end
    count == 9
  end

  def draw?(array)
    full?(array) && !win?(array) ? true : false
  end

  def over?(array)
    win?(array) || draw?(array) || full?(array) ? true : false
  end

  def winner(array)
    win?(array)
    @wins.each do |win_combo|
      pos = [array[win_combo[0]], array[win_combo[1]], array[win_combo[2]]]
      unq = pos.uniq
      @player1.symbol if unq == @player1.symbol
      @player2.symbol if unq == @player2.symbol
    end
  end

  def player(board)
    winner(board) == @player1.symbol ? @player2.name : @player1.name
  end

  def play(board)
    turn(board) until over?(board)
    if win?(board)
      puts 'Congratulations ' + player(board) + '!'
    elsif draw?(board)
      puts 'Its a draw!'
    end
  end
end
