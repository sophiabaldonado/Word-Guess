require 'pry'
require 'colorize'

class WordGuess
  def initialize
    puts "FANTASY WORD GUESS GAME"
    puts "-" * 40
    @easy_word_array = %w[ tree legend dragon knight night wizard  goblin queen king princess elf dwarf fairy slay honor joust kingdom sword spear forest]
    @hard_word_array = %w[kingdom centaur sorcerer courageous whimsical petrify leprechauns conjure enchanting cauldron]
    @already_guessed_letters = []
    @tally = 0
    difficulty_level
    @current_word = @word_array.sample
    @correct_letters = Array.new(@current_word.length, "_" )
  end



  def difficulty_level
    puts "What difficulty would you like? Easy or Hard?"
    level = gets.chomp.downcase
    if level == "hard"
      @word_array = @hard_word_array
    elsif level == "easy"
      @word_array =@easy_word_array
    end
  end
#this is what we show the user first. An image, and dashed lines and prompt choose a letter.

def ascii
  if @tally == 0
puts "
                                                           _  _
                                                          (.|( ) ✨
                                                          (_Y|_/
                                                           /_|
                                                             L
                         "

  elsif @tally == 1
puts "

  <~>
   | |,_____
         ___`|
         |"+"('>".colorize(:red)+"|`-__
           ~      ~~~--__
                 ______  (@|                              _  _
                /     ~~~~||                             (.|( ) ✨
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
                /******~~~~||*********                   (.|( ) ✨
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
                /******~~~~||********************  ****** (.|( ) ✨
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

  ".colorize(:red).blink
  puts "The word was: #{@current_word}".colorize(:magenta)
  end
end

def check_letter
  #we ask for user input using gets.chomp
  @tally = 0
  while @tally < 4
    puts "Choose a letter"
    puts "Word: #{@correct_letters.join(" ")}".colorize(:green)
    letter = gets.chomp
    if letter.length > 1
      if letter == @current_word
        you_win
      end
    end
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
      puts "Try again, mortal, the fairy is depending on you!🔥 ".colorize(:yellow)
    end

    if @current_word.split(//) == @correct_letters
      you_win
    end
    puts "You have guessed: #{@already_guessed_letters.join(" ")}".colorize(:blue)
  end
end

def you_win
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

a.ascii
a.check_letter
