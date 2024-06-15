# frozen_string_literal: false

# Computer Intelligence Class
class ComputerIntelligence
  include('modules/game_helper')

  attr_reader :deduct_code_outcomes
  attr_accessor :guess

  def initialize
    @guess = []
  end

  def place_guess
    @guess = [generate_num, generate_num, generate_num, generate_num]
    @guess
  end

  def deduct_possible_outcomes(guess, clue)
    # Deducts Outcomes based on Clue
  end

  def eliminate_outcome(digit)
    # Removes Outcomes based on Digit
  end

  def eliminate_outcome_dont_belong(guess)
    # Removes Outcomes based on Guess
  end

  def eliminate_outcome_with_index(digit, index)
    # Removes Outcomes based on Digit & Index
  end
end
