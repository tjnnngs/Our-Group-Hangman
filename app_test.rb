require "minitest/autorun"
require_relative "app.rb"

class TestHangman < Minitest::Test

	def test_assert_that_1_equals_1
		assert_equal(1, 1)
	end

	def test_assert_that_empty_string_returns_true
		secret_word = ""
		assert_equal(true, get_word?(secret_word)) 
	end #first value is what we expect, 2nd value is function w/ variable

	def test_assert_string_returns_true
		secret_word = "cat"
		assert_equal(true, get_word?(secret_word))
	end	

	def test_assert_integer_returns_false
		secret_word = 17
		assert_equal(false, get_word?(secret_word))
	end

	def test_assert_array_returns_false
		secret_word = []
		assert_equal(false, get_word?(secret_word))
	end

	def test_assert_thats_length_for_fox_is_3
		secret_word = "fox"
		assert_equal(3, get_secret_word_length(secret_word))
	end

	def test_assert_that_string_contains_a_letter
		secret_word = "fox"
		guess = "o"
		assert_equal(true, in_word?(secret_word, guess))
	end

	def test_assert_that_string_does_not_contain_a_letter
		secret_word = "fox"
		guess = "w"
		assert_equal(false, in_word?(secret_word, guess))
	end

	def test_assert_o_is_put_in_the_right_array
		secret_word = "fox"
		guess = "o"
		assert_equal(true, in_word?(secret_word, guess))
	end

	def test_assert_x_is_put_in_the_wrong_array
	secret_word = "fox"
	guess = "w"
	assert_equal(false, in_word?(secret_word, guess))
	end
end