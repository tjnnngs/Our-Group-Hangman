#Hangman
#already guessed not working

def get_players()
	p "Enter the number of players (one OR two)"
	$players = gets.chomp
end

def get_secret_word(players)
	if players == "two"
		input_secret_word()
	else
		pick_secret_word()
	end
end

def input_secret_word()
	p "Player 1 - enter the secret word"
	$secret_word_array = gets.scan(/./)
end

def pick_secret_word()
	#creates an array of a secret words to choose from
	wordbank = ["foobar", "tapioca", "wombat", "skylight", "lizard", "fox"]
	#randomly chooses a word from thr wordbank for the game
	$secret_word_array = wordbank.shuffle.first.scan(/./)
end

def display_blanks(secret_word_array)
	#creates an empty array to build the guessed word
	$my_guess_array = []
	$secret_word_array.length.times do
		$my_guess_array << "_"
	end	
end
def create_letterbox_hash()
	$alphabet = [*?a..?z] #creates an array from the alphabet
	position = (0..25).to_a #creates an array of the corresponding numbers of the alphabet letters
	$letterbox = Hash[$alphabet.zip position]
end

def guess_a_letter(secret_word_array, my_guess_array, alphabet, wrong_guesses, wrong_letters, solved, all_letters)
	puts "The secret word has #{$secret_word_array.length} letters and currently looks like #{$my_guess_array}"
	puts "Pick a letter from #{$alphabet}"
	counter = 0
	found = false
	guess = gets.chomp
	if $all_letters.include?(guess)
		puts "You already guessed #{guess}. Try again!"
	else
		$secret_word_array.each do |letter|
			if letter == guess
				$my_guess_array[counter] = guess
				found = true
			end
			$alphabet[$letterbox[guess] ] = "*" #look at .delete
			counter = counter + 1
		end
		if found == false
			$wrong_guesses = $wrong_guesses + 1
			$wrong_letters << guess
			$wrong_letters = $wrong_letters.sort
			puts "Letter not found; wrong guesses = #{$wrong_guesses} including #{$wrong_letters}"
		end	
		$all_letters << guess
	end
end	
def you_lose(wrong_guesses, secret_word_array)
	if $wrong_guesses == 10
		puts "Too many wrong guesses. The answer was #{$secret_word_array}."
	end
end
def you_win(secret_word_array, my_guess_array, solved)
	if $my_guess_array == $secret_word_array
		$solved = true
		puts "Winner Winner, Chicken Dinner! You guessed the secret word!"
	end
end


def run_program()
	get_players()
	get_secret_word($players)
	display_blanks($secret_word_array)
	create_letterbox_hash()
	$solved = false
	$wrong_guesses = 0
	$all_letters = []
	$wrong_letters = []
	while $solved == false && $wrong_guesses < 10
		guess_a_letter($secret_word_array, $my_guess_array, $letterbox, $wrong_guesses, $wrong_letters, $solved, $all_letters)
		you_lose($wrong_guesses, $secret_word_array)
		you_win($secret_word_array, $my_guess_array, $solved)
	end
end

run_program()