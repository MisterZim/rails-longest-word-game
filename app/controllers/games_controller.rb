require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @word = params[:word] # rails helper
    @letters = params[:letters].split(" ")
    # test if word is valid according to grid
    if @letters.sort.include?(@word.downcase.split.sort)
      # is word an english word(api call)
      url = "https://wagon-dictionary.herokuapp.com/#{@word}"
      dictionary = open(url).read
      response = JSON.parse(dictionary)
      result = response['found']
      if result
        puts 'nice word'
        raise
      end
    end
  end
end
