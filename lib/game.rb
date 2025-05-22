# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Declaration of Game class
class Game
  attr_reader :player1, :player2, :board

  def initialize
    print 'Declare your name, Player 1: '
    p1_name = gets.to_s.chomp
    print 'Declare your name, Player 2: '
    p2_name = gets.to_s.chomp

    @player1 = Player.new(p1_name, 'X')
    @player2 = Player.new(p2_name, 'O')
    @current_player = @player1

    @game_finished = false
    @board = Board.new
    board.print_board
  end

  def switch_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def start_game
    take_turn until @game_finished == true
  end

  def take_turn
    print "#{@current_player.name}, which position will you place your #{@current_player.marker} (1-9)?: "
    choice = gets.to_i

    if @board.space_available?(choice) == false
      deny_move
    else
      confirm_move(choice)
    end
  end

  def deny_move
    puts "Sorry, #{@current_player.name}, that space is already taken. Please choose another."
    @board.print_board
    take_turn
  end

  def confirm_move(choice)
    board.update(choice, @current_player.marker)
    @current_player.spaces_taken.push(choice)
    board.print_board
    if board.three_in_a_row?(@current_player)
      win_game(@current_player)
    else
      switch_current_player
      return unless @board.full?

      end_in_draw
    end
  end

  def win_game(player)
    puts "Game over! #{player.name} wins!"
    @game_finished = true
  end

  def end_in_draw
    puts "Cat's game! Nobody wins!"
    @game_finished = true
  end
end
