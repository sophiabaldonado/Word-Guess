require 'colorize'

class WordGuess
  def initialize
    @word_array = [ "tree"]
    @current_word = @word_array.sample
    @already_guessed_letters = []
    @correct_letters = Array.new(@current_word.length, "_" )

  end
#this is what we show the user first. An image, and dashed lines and prompt choose a letter.

def ascii
if @tally == 1
puts "

  <~>
   | |,_____
         ___`|
         |('>|`-__
           ~      ~~~--__
                 ______  (@|                              _  _
                /     ~~~~||                             (.|( ) *
        |       `--____                                   (_Y|_/
       / ~~~--_____    ~~~/                                /_|
                   `~~~~~                                    L
                         "

elsif @tally == 2
  puts "

  <~>
   | |,_____
         ___`|
         |('>|`-__
           ~      ~~~--__
                 ______  (@|   *******                    _  _
                /******~~~~||*********                   (.|( ) *
        |       `--____***************                    (_Y|_/
       / ~~~--_____    ~~~/ ************                   /_|
                   `~~~~~         ******                     L



  "
elsif @tally == 3
  puts "
  <~>
   | |,_____                                                        ______
         ___`|                                                     (Oh no!)
         |('>|`-__                                                  ⁻⁻⁻⁻⁻⁻
           ~      ~~~--__            **                            o
                 ______  (@|   *******  ****               _  _   º
                /******~~~~||********************  ****** (.|( ) *
        |       `--____*************************** ******  (_Y|_/ **
       / ~~~--_____    ~~~/ *************************** **  /_| **
                   `~~~~~         *********************       L
                                        ****    *****  ***** ****
                                          ***

  "

  ______
 (Oh no!)
  ⁻⁻⁻⁻⁻⁻
 o
º

elsif @tally == 4
  puts "
  <~>
   | |,_____
         ___`|
         |('>|`-__
           ~      ~~~--__            **              ***
                 ______  (@|   *******  ****    *******    ******
                /******~~~~||**********************************
        |       `--____******************************************
       / ~~~--_____    ~~~/ ***************************************
                   `~~~~~         ******************************
                                        ****    **************
                                          ***       ***********
                                                          ********

  "

  end
end

def check_letter


  #we ask for user input using gets.chomp
  @tally = 0
  while @tally < 3
    puts "choose a letter"
    puts @current_word
    letter = gets.chomp
    @already_guessed_letters << letter
    if @current_word.include? letter
      @current_word.split(//).each_index do |i|
        if @current_word[i] == letter
          @correct_letters[i] = letter
          puts "correct letters: #{@correct_letters}"
        end
      end
    else
      puts "no"
      @tally = @tally + 1
      ascii
    end
    if @current_word.split(//) == @correct_letters
      puts "


      .-:.     ::-.   ...      ...    :::  .::    .   .:::::::::.    :::. .: .:
       ';;.   ;;;;'.;;;;;;;.   ;;     ;;;  ';;,  ;;  ;;;' ;;;`;;;;,  `;;;;;;;;;
         '[[,[[[' ,[[      [[,[['     [[[   '[[, [[, [['  [[[  [[[[[. '[['[['[[
           c$$''   SSS,     SSSSS      SSS    YScSSScSP   SSS  SSS 'YScSS SS SS
         ,8P'`    '888,_ _,88P88    ,d888      '88'888    888  888    Y88 '' ''
        mM'         'YMMMMMP'  'YmmMMMM''       'M 'M'    MMM  MMM     YM MM MM
      ".colorize(:cyan).blink
      exit
    end
    puts " you have guessed: #{@already_guessed_letters}"
    puts " #{@correct_letters}"
  end
end



#if the letter is part of the word or not tell the user and ask them for the next letter.
#if letter is wrong decerement the tally if letter is right don't decerement

#when tally == 0 lose and dragon art eats them
#when user guesses the word end the program (or play again)
# @current_word.split.each do |i|
#   if letter == i
#     @correct_letters[i.index] = letter
#     puts  "#{@correct_letters} this shold be an array"
#   end
# end

end




a = WordGuess.new
a.check_letter
