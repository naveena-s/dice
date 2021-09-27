require "byebug"
require "test/unit"
require_relative 'dice.rb'

class DiceTest < Test::Unit::TestCase

   def test_rolls
      sided_6 = ::Dice.new(6)
      sided_8 = ::Dice.new(8)
      sided_24 = ::Dice.new(24)
      val = sided_6.roll
      assert_equal(true, ( val >= 1 && val <= 6))

      val = sided_8.roll
      assert_equal(true, ( val >= 1 && val <= 8))

      val = sided_24.roll
      assert_equal(true, ( val >= 1 && val <= 24))
   end

   def roller
    options = {
      number_of_dice: 1,
      sides: 6,
      number_of_rolls: 1
    }

    res = RollerService.new(options).call
    assert_equal(1, res.keys.count)
   end  
end
