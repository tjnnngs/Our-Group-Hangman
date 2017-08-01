#Hangman

def get_word()
	#creates an array of a secret words to choose from
	wordbank = ["foobar", "tapioca", "wombat", "skylight", "lizard", "fox"]
	#randomly chooses a word from thr wordbank for the game
	secret_word_array = wordbank.shuffle.first.scan(/./)
	#creates an empty array to build the guessed word
	my_word_guess = []
	secret_word_array.length.times do
		my_word_guess << "_"
	end
	guess_a_letter(secret_word_array, my_word_guess) 
end

def guess_a_letter(secret_word_array, my_word_guess)
	solved = false
	wrong_guesses = 0
	wrong_letters = []
	while solved == false && wrong_guesses < 10
		puts "The secret word has #{secret_word_array.length} letters and currently looks like #{my_word_guess}"
		puts "Guess a letter: "
		guess = gets.chomp
# 		if wrong_letters.include?(guess)
# 			puts "You already guessed #{guess}!"
# 		end
		counter = 0
		found = false
		secret_word_array.each do |letter|
			if letter == guess
				my_word_guess[counter] = guess
				found = true
			end
		counter = counter + 1
		end
		if found == false
			wrong_guesses = wrong_guesses + 1
			wrong_letters << guess
			puts "Letter not found; wrong guesses = #{wrong_guesses} including #{wrong_letters}"
		end
		if my_word_guess == secret_word_array
			solved = true
			puts "TA-DA! You guessed the secret word: #{secret_word_array}!"
		end

		if wrong_guesses == 10
			puts "Too many wrong guesses. Try again!"
		end
	end	
end


get_word()

