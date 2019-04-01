# UserInterface has game information and display information
class UserInterface
  INFO = <<DOC.freeze
  *******************************************************************
                    Tic-Tac-Toe game in Ruby Language
                                Authors:
                          Musa Jabbaaru Ntege
                              Zeha Irawan
  *******************************************************************
DOC

  def initialize
    display_info
  end

  def display_info
    puts INFO
  end

  def display(board)
    board.each_with_index do |position, i|
      print "\n+-----------+ \n| " if (i % 3).zero?
      print "#{position} | "
      puts "\n+-----------+ \n\n" if i == 8
    end
  end

  def enter_name(num)
    puts "Enter your name player#{num} to play"
    name = gets.chomp
    name
  end
end
