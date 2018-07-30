require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @user_input = params['user_input'].chars
    @grid = params['grid']
    if check_letters?(@user_input, @grid) == true == english_word?(@user_input.join)

  end

  def check_letters?(user_input, grid)
    user_input.each do |letter|
      return false if !grid.include? letter
    end
    true
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json["found"]
  end


end


