require 'colorize'

class Game
attr_reader :hangman, :dash, :word
def initialize()
    @dash = []
    @strike = 0
    @word = nil
    @hangman = ["\u2502","\u2500"," ","\u250C","\u2510"," "," "," "," "]
    #gallows: 0, horizontal_line: 1, head: 2, corner: 3, rope: 4, left_arm: 5, right_arm: 6, body: 7, left_leg: 8, right_leg: 9
end

def display_gameInterface()
    puts "#{@hangman[3]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[1]}#{@hangman[4]}"
puts "#{@hangman[0]}           #{@hangman[0]}"
puts "#{@hangman[0]}           #{@hangman[2]}"
puts "#{@hangman[0]}          #{@hangman[5]}#{@hangman[7]}#{@hangman[6]}"
puts "#{@hangman[0]}           #{@hangman[7]}"
puts "#{@hangman[0]}          #{@hangman[8]} #{@hangman[9]}"
for i in (0..3)
    puts "#{@hangman[0]}"
end
puts "\n"
end

def random_word()
    word = File.readlines('google-10000-english-no-swears.txt')
    random_num = rand(0..9000)
    return word[random_num]
end

def blank_dash()
    @word = "programming"
    dash_length = @word.length 

    while dash_length > 0
        @dash.push("_")
        dash_length -= 1
        end
        @dash = @dash.join(' ')
end

def strike_on_wrong_guess
    if @strike == 1
        @hangman[2] = "\u25EF" #head
    elsif @strike == 2
        @hangman[7] = "\u2502" #body
    elsif @strike == 3
        @hangman[5] = "\u2571" #left_arm
    elsif @strike == 4
        @hangman[6] = "\u2572"  #right_arm
    elsif @strike == 5
        @hangman[8] = "\u2571"
    elsif @strike == 6
        @hangman[9] = "\u2572"
    end

end

def startGame()
    blank_dash()
    word =  @word
    puts @dash
    until @strike > 7

        if @strike > 6
            puts "you have been hanged".colorize(:red)
            break
        elsif @dash.include?('_') == false
                puts "Congrats! you Guessed the right word".colorize(:green)
                break
        end
            
        letter = gets.chomp
        arr = word.split('').join(' ').split('')

        if arr.include?(letter)
            arr.each_with_index do |item,index|
                if letter == item
                    @dash[index] = letter
                end
            end
        else
            @strike +=  1
            strike_on_wrong_guess()
        end
    
        display_gameInterface()
        puts @dash

    end
    puts "This correct word is #{@word}"
end

end

hangman = Game.new
hangman.startGame
#  hangman.blank_dash
# puts hangman.word
#  hangman.dash[0] = "R"
#  hangman.dash[4] = "U"
# puts hangman.dash


# hangman.hangman[2] = "\u25EF"
# hangman.hangman[7] = "\u2502"
# hangman.hangman[5] = "\u2571"
# hangman.hangman[6] = "\u2572"
# hangman.hangman[8] = "\u2571"
# hangman.hangman[9] = "\u2572"
# hangman.display_gameInterface