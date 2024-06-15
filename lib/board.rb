# frozen_string_literal: true

require_relative('modules/game_helper')

# Class Board
class Board
  include GameHelper
  attr_accessor :board

  def initialize
    @board = Array.new(12) { Array.new(4, ' ') }
    @clues = Array.new(12) { Array.new(4, ' ') }
    @guesses = []
  end

  def render_board(round, code)
    puts board_build_header(round, code.clone)

    @board.each_with_index do |row, index|
      board_build_row(row, index, @clues)
      puts ''
    end

    puts '=========================='
  end

  def current_guess(round)
    @guesses[round]
  end

  def append_guess(guess, round)
    @board.reverse!
    @board[round] = guess
    @guesses.push(guess)
    @board.reverse!
  end

  def append_clue(clue, round)
    @clues.reverse!
    @clues[round] = clue
    @clues.reverse!
  end
end
