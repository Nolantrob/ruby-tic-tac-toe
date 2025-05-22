# frozen_string_literal: true

require 'pry-byebug'

require_relative 'lib/game'

puts 'Welcome to Tic-Tac-Toe!'

game = Game.new

game.start_game
