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