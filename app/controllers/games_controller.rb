require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def home
  end

  def new
    (0...10).map { ('a'..'z').to_a[rand(26)].capitalize }
  end

  def score
    @submit_word = params[:word]
    @letters = params[:letters]
    @bool_valid = parse_word(@submit_word) ? true : false
  end

  def parse_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = URI.open(url).read
    final_word_parsed = JSON.parse(user_serialized)['found']
  end
end
