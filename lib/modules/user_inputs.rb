# frozen_string_literal: true

# Module User Inputs
module UserInput
  def input_guess
    loop do
      puts "\nLEGENDS: #{'[1] RED'.colorize(:red)}, #{'[2] YELLOW'.colorize(:yellow)}, #{'[3] GREEN'.colorize(:green)},
         #{'[4] CYAN'.colorize(:cyan)}, #{'[5] BLUE'.colorize(:blue)}, #{'[6] MAGENTA'.colorize(:magenta)}\n\n"
      print 'Enter your guess (ex: 1234 or 4536): '
      guess = gets.chomp

      return guess if /^[1-6]*$/.match?(guess) && guess.length.eql?(4)

      puts "\nInvalid Input. Please enter a valid Guess.".colorize(:red)
    end
  end

  def input_game_mode
    loop do
      puts "\nWhat are you going to play as?\n [1] - Play as Code Maker\n [2] - Play as Code Breaker\n\n"
      print 'Enter your choice: '
      choice = gets.chomp

      return choice.to_i if choice.eql?('1') || choice.eql?('2')

      puts 'Invalid Input. Please enter a valid Choice.'.colorize(:red)
    end
  end

  def input_code
    loop do
      puts "\nLEGENDS: #{'[1] RED'.colorize(:red)}, #{'[2] YELLOW'.colorize(:yellow)}, #{'[3] GREEN'.colorize(:green)},
         #{'[4] CYAN'.colorize(:cyan)}, #{'[5] BLUE'.colorize(:blue)}, #{'[6] MAGENTA'.colorize(:magenta)}\n\n"
      print 'Enter Code: (ex: 1234 or 4536): '
      guess = gets.chomp

      return guess if /^[1-6]*$/.match?(guess) && guess.length.eql?(4)

      puts "\nInvalid Input. Please enter a valid Guess.".colorize(:red)
    end
  end
end
