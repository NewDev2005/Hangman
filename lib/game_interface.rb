require 'colorize'

class Game
attr_reader :hangman, :dash
def initialize
    @dash = []
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

end

def random_word()
    word = File.readlines('google-10000-english-no-swears.txt')
    random_num = rand(0..9000)
    return word[random_num]
end

def blank_dash()
    dash_length = random_word().length 

    while dash_length > 0
        @dash.push("__")
        dash_length -= 1
        end
        @dash = @dash.join(' ')
end

end

hangman = Game.new
p hangman.random_word
puts hangman.blank_dash

# hangman.hangman[2] = "\u25EF"
# hangman.hangman[7] = "\u2502"
# hangman.hangman[5] = "\u2571"
# hangman.hangman[6] = "\u2572"
# hangman.hangman[8] = "\u2571"
# hangman.hangman[9] = "\u2572"
# hangman.display_gameInterface