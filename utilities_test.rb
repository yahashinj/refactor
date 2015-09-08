require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	# Tests go here
	def test_leap_year
		assert_equal true, @m.leap_year?(0)
		assert_equal false, @m.leap_year?(1997)
		assert_equal true, @m.leap_year?(2000)
		assert_equal false, @m.leap_year?(1900)
		assert_equal false, @m.leap_year?(333)
		assert_equal true, @m.leap_year?(16)
	end

	def test_percent_of_year
		assert_equal '100%', @m.leap_year?(31536000.0)
		assert_equal '50%', @m.leap_year?(15768000)
	end
end
