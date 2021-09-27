require 'tty-prompt'
require_relative 'roller_service.rb'

prompt = TTY::Prompt.new

dice_choices = %w(1 2 3)
sides_choices = %w(6 8 24)

chosen_sides = []
number_of_rolls = nil

number_of_dice = prompt.select("Select number of Dice?", dice_choices)

while chosen_sides.empty? || chosen_sides.nil?
	number_of_dice.to_i.times do |index|
		chosen_sides << prompt.select("What is the sides of Dice ?", sides_choices)
	end
end

while number_of_rolls.nil?
number_of_rolls = prompt.ask("Provide digit:", convert: :int) do |q|
									  q.convert(:int, "Please enter a number")
									  q.convert :int
									  q.messages[:convert?] = "In valid input, please enter a number"
									end
end

options = {
	number_of_dice: number_of_dice.to_i,
	sides: chosen_sides,
	number_of_rolls: number_of_rolls
}

res = RollerService.new(options).call

puts res