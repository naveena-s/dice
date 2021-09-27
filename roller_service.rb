require 'byebug'
require_relative 'dice.rb'
class RollerService
  
  attr_reader :number_of_rolls, :dice_set

  def initialize(options = {})
    @number_of_rolls = options[:number_of_rolls]
    @dice_set        = make_dice(options[:number_of_dice], options[:sides])
  end

  def call
    rolls = {}
    puts "ROLLING DICE"
    number_of_rolls.times do |roll|
      puts "="*25
      puts "Roll No: #{roll+1}"
      puts "-"*25
      rolls[roll+1] ||= []
      dice_set.each do |dice|
         rolls[roll+1] << {dice.sides => dice.roll}
         puts "Dice With Side: #{dice.sides} Roll Value #{dice.roll}"
      end
    end
    rolls
  end

  def make_dice(number_of_dice, sides)
    set = []
    number_of_dice.times do |number|
      set << Dice.new(sides[number].to_i)
    end
    set
  end

end
