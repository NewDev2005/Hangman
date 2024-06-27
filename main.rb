require_relative 'lib/game_interface'
require_relative 'lib/player'

# hangman = Game.new
# player = Player.new


def play_game
    hangman = Game.new
   
    puts "Enter '1' if would you like to play the previously saved game"
    puts "Enter '2' for New Game"
    user = gets.chomp
    until user == '1' || user == '2'
        puts "Sorry Invalid Input".colorize(:red)
        user = gets.chomp
        puts "\n"
    end
    if user == "1"
        hangman.reload
       
    elsif user == "2"
        hangman.create_blank_dash
        hangman.startGame
    end
end

play_game