require 'colorize'

class WordGuess
  def initialize
    @word_array = [ "tree"]
    @current_word = @word_array.sample
    @already_guessed_letters = []
    @correct_letters = Array.new(@current_word.length, "_" )
    @tally = 0
  end
#this is what we show the user first. An image, and dashed lines and prompt choose a letter.

def ascii
if @tally == 0
puts "






                                                           _  _
                                                          (.|( ) *
                                                          (_Y|_/
                                                           /_|
                                                             L
                         "

elsif @tally == 1
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
           ~      ~~~--__            **       *****       ****     o  *
                 ______  (@|   *******  ****         ***   _  _   º **
                /******~~~~||********************  ****** (.|( ) *
        |       `--____*************************** ******  (_Y|_/ ** **
       / ~~~--_____    ~~~/ *************************** **  /_| **      **
                   `~~~~~         *********************       L     ***
                                        ****    *****  ***** ****
                                          ***

  "

elsif @tally == 4
  puts "
  <~>                          ___________
   | |,_____                  (BWAHAHAAHA!)
         ___`|                 ⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻
         |('>|`-__            o
           ~      ~~~--__   º        **              ***
                 ______  (@|   *******  ****    *******    ******
                /******~~~~||**********************************
        |       `--____******************************************
       / ~~~--_____    ~~~/ ***************************************
                   `~~~~~         ******************************
                                        ****    **************
                                          ***       ***********
                                                          ********

  ".colorize(:red)
  puts "The word was: #{@current_word}".colorize(:magenta).blink
  end
end

def check_letter
  #we ask for user input using gets.chomp
  @tally = 0
  while @tally < 4
    puts "Choose a letter"
    puts "Word: #{@correct_letters.join(" ")}".colorize(:green)
    letter = gets.chomp
    @already_guessed_letters << letter
    if @current_word.include? letter
      @current_word.split(//).each_index do |i|
        if @current_word[i] == letter
          @correct_letters[i] = letter
        end
      end
      ascii
    else
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
    puts "You have guessed: #{@already_guessed_letters.join(" ")}".colorize(:blue)
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

puts "FANTASY WORD GUESS GAME"
puts "-" * 40
a.ascii
a.check_letter
