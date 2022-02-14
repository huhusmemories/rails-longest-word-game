require "open-uri"
class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    # raise
    @selected_word = params[:word]
    # Need to fetch this api
    url = "https://wagon-dictionary.herokuapp.com/#{@selected_word}"
    serialized_word = URI.open(url).read
    word = JSON.parse(serialized_word)
    # raise
    # Need another layer of logic to check (.all?) compare the letters from the word and the game
    # if matches.
     if word["found"] == true
      @result = "Congratulations #{@selected_word} is a valid choice"
    else
      @result = "Unfortunately #{@selected_word} is not a valid choice"
    end
  end
end
