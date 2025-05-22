# frozen_string_literal: true

# Declaration of Board Class
class Board
  LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @board = Array.new(9, ' ')
  end

  def print_board
    puts "\n#{@board[0]}|#{@board[1]}|#{@board[2]}"
    puts '-----'
    puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
    puts '-----'
    puts "#{@board[6]}|#{@board[7]}|#{@board[8]}\n\n"
  end

  def clear
    @board = Array.new(9, ' ')
  end

  def update(choice, marker)
    @board[choice - 1] = marker if space_available?(choice)
  end

  def full?
    @board.none? { |cell| cell == ' ' }
  end

  def space_available?(space)
    @board[space - 1].include?(' ')
  end

  def three_in_a_row?(current_player)
    LINES.any? do |line|
      line.all? { |el| current_player.spaces_taken.include?(el) }
    end
  end
end
