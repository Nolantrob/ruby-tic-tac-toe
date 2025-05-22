# frozen_string_literal: true

# Declaration of player class
class Player
  attr_reader :name, :marker
  attr_accessor :spaces_taken

  def initialize(name, marker)
    @name = name.capitalize
    @marker = marker
    @spaces_taken = []
  end

  def to_s
    "#{@name}: #{@marker}"
  end
end
