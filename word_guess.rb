class WordGuess
  def initialize
    @word_array = ["make","go","taco"]
  end
#this is what we show the user first. An image, and dashed lines and prompt choose a letter.

def check_letter
  puts "Choose a letter"

  #we ask for user input using gets.chomp

  tally = 0

  while tally < 3
  letter = gets.chomp
    @word_array.each do |word|
      if word.include? letter
        puts "yes"
      else
        puts "no"
        tally = tally + 1
      end
    end
  end
end



#if the letter is part of the word or not tell the user and ask them for the next letter.
#if letter is wrong decerement the tally if letter is right don't decerement

#when tally == 0 lose and dragon art eats them
#when user guesses the word end the program (or play again)


end

a = WordGuess.new
a.check_letter
