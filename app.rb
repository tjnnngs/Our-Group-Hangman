def get_word?(secret_word) 
	if secret_word.class == String
		true
	else
		false
	end
end

number_of_letters_in_secret_word = 0
def get_secret_word_length(secret_word)
	number_of_letters_in_secret_word = secret_word.length
end

def in_word?(secret_word, guess)
	right_guesses = []
	wrong_guesses = []
	if secret_word.include? guess
		right_guesses << guess
		true
	else
		wrong_guesses << guess
		false
	end
end 

def determine_position(secret_word, guess)
	found = false
	my_guess = []
	secret_word_array = []
	secret_word.each_char do |letter|
		secret_word_array << letter
	end
	counter = 0
	secret_word_array.each do |letter|
		if letter == guess
			my_guess[counter] = guess
			found = true
		end
	counter = counter + 1
	end
	p "The secret word is #{secret_word_array}"
	p "My guess is #{my_guess}"
	found	
end