# frozen_string_literal: true

require_relative('modules/game_helper')
require_relative('modules/user_inputs')
require_relative('computer_intelligence')

# Class Game
class Game
  include UserInput
  include GameHelper

  def initialize(board)
    @board = board
    @code = [1, 2, 3, 1]
    @game_mode = nil
    @round = 0

    @computer = ComputerIntelligence.new
  end

  def generate_code
    puts "\nSetting up the Code...".colorize(:yellow)
    sleep(2)

    return if @game_mode.eql?(1)

    @code = [generate_num, generate_num, generate_num, generate_num]

    puts "Code Created!\n\nGoodluck!".colorize(:yellow)
    sleep(2)
  end

  def game_start
    puts '==============================='
    puts '--------| WELCOME  TO |--------'
    puts '------| MASTERMIND GAME |------'
    puts '==============================='

    display_game_mechanics

    # Set Rules
    @game_mode = input_game_mode

    @game_mode.eql?(1) ? play_as_code_maker : play_as_code_breaker
  end

  def play_as_code_maker
    @code = input_code.split('').map!(&:to_i)

    12.times do |index|
      @board.render_board(index, @code)
      puts "\nComputer is guessing...".colorize(:yellow)
      computer_guess = @computer.place_guess

      sleep(2)

      check_guess(computer_guess.join)
    end
  end

  def play_as_code_breaker
    generate_code

    12.times do |round|
      @board.render_board(round, @code)
      guess
    end
  end

  def guess
    check_guess(input_guess)
  end

  def check_guess(guess)
    @board.append_guess(get_colored_guess(guess.split('').map(&:to_i)), @round)
    # generate_clue(guess.split(''))
    generate_clue(guess.split('').map(&:to_i))

    game_over if guess.split('').map(&:to_i).eql?(@code) || @round.eql?(11)
    @round += 1
  end

  def generate_clue(guess)
    properties = feedback_counter(@code, guess)

    # Generate the feedback string
    feedback = []
    feedback_maker(feedback, properties)

    @board.append_clue(feedback.shuffle, @round)
  end

  def feedback_maker(feedback, properties)
    properties[:right_place].times { feedback << '+'.colorize(:red) }
    properties[:right_color_wrong_place].times { feedback << '+' }
    (@code.size - feedback.size).times { feedback << ' ' }
  end

  def game_over
    @board.render_board(12, @code)

    puts "\nGame Over!".colorize(:red)

    if @board.board.length.eql?(11)
      puts 'Code Maker Wins!'.colorize(:yellow)
    else
      puts 'Code Breaker Wins!'.colorize(:yellow)
    end

    exit(0)
  end
end
