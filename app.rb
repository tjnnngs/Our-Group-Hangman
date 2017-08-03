require 'sinatra'
require_relative 'hangman.rb'

get '/	redirect '/splash'
' do
end

get '/splash' do
	erb :splashscreen
end

post '/getplayers' do
	players = params[:players]
	redirect '/getsecretword?players=' + players
end

get '/getsecretword' do
	players = params[:players]
	if players == "two"
		erb :getsecretword
	else
		secret_word = one_player()
		erb :twoplayerpatch, :locals => {:secret_word => secret_word}
	end
end

post '/gotsecretword' do
	secret_word = params[:secret_word]
	redirect '/getguess?secret_word=' + secret_word
end

post '/twoplayerpatch' do
	secret_word = params[:secret_word]
	redirect '/getguess?secret_word=' + secret_word
end	

get '/getguess' do
	secret_word = params[:secret_word]
	display_word = set_display_word(secret_word)
	erb :getguess, :locals => {:display_word => display_word}
end

post '/processguess' do
	guess = params[:guess]
end
