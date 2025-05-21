# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Declaration of Game class
class Game
  attr_reader :player1, :player2, :board

  def initialize
    puts 'Welcome to Tic-Tac-Toe!'
    print 'Declare your name, Player 1: '
    p1_name = gets.to_s.chomp
    print 'Declare your name, Player 2: '
    p2_name = gets.to_s.chomp

    @player1 = Player.new(p1_name, 'X')
    @player2 = Player.new(p2_name, 'O')
    @current_player = @player1

    @board = Board.new
    board.print_board
  end

  def switch_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def start_game
    take_turn until board.full? == true
  end

  def take_turn
    print "#{@current_player.name}, which position will you place your #{@current_player.marker} (1-9)?: "
    choice = gets.to_i

    if @board.space_available?(choice) == false
      puts 'Sorry, that space is already taken. Please try again.'
      @board.print_board
      take_turn
    else
      board.update(choice, @current_player.marker)
      board.print_board
      switch_current_player
    end
  end
end
