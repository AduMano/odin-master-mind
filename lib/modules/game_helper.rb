# frozen_string_literal: true

# Game Helper Module
module GameHelper # rubocop:disable Metrics/ModuleLength
  def generate_num
    ((rand * 6) + 1).floor
  end

  def count_right_color_places(code, guess, properties)
    code.each_with_index do |peg, index|
      if guess[index] == peg
        properties[:right_place] += 1
      else
        properties[:code_count][peg] += 1
        properties[:guess_count][guess[index]] += 1
      end
    end
  end

  def count_right_color_wrong_places(properties)
    properties[:guess_count].each do |peg, count|
      if (properties[:code_count][peg]).positive?
        properties[:right_color_wrong_place] += [count, properties[:code_count][peg]].min
      end
    end
  end

  def feedback_counter(code, guess)
    properties = {
      right_place: 0,
      right_color_wrong_place: 0,
      code_count: Hash.new(0),
      guess_count: Hash.new(0)
    }

    count_right_color_places(code, guess, properties)
    count_right_color_wrong_places(properties)

    { right_place: properties[:right_place], right_color_wrong_place: properties[:right_color_wrong_place],
      code_count: properties[:code_cound], guess_count: properties[:guess_count] }
  end

  def get_colored_guess(guess)
    colors = {
      '1': 'red',
      '2': 'yellow',
      '3': 'green',
      '4': 'cyan',
      '5': 'blue',
      '6': 'magenta'
    }
    guess.map! { |peg| '○'.to_s.colorize(colors[peg.to_s.to_sym].to_sym) }
  end

  def board_build_header(round, code)
    colored_code = get_colored_guess(code)

    if round.eql?(12)
      "\n======= MASTERMIND =======
      \r| #{colored_code[0]} || #{colored_code[1]} || #{colored_code[2]} || #{colored_code[3]} ||CLUE|
      \r==========================\n"
    else
      "\n======= MASTERMIND =======\n| # || # || # || # ||CLUE|\n==========================\n"
    end
  end

  def board_build_row(row, index, clues)
    row.each do |peg|
      print "| #{peg} |"
    end

    print '|'
    clues[index].each { |clue| print clue }
    print '|'
  end

  def display_game_mechanics # rubocop:disable Metrics/AbcSize
    puts "Be the #{'CODE MAKER'.colorize(:red)} or #{'CODE BREAKER'.colorize(:yellow)}!"
    puts "\nMECHANICS: "
    puts " - As #{'CODE MAKER'.colorize(:red)}, You setup the code and let the computer guess the code!"
    puts " - As #{'CODE BREAKER'.colorize(:yellow)}, Guess the code thats been created by the computer!"
    puts ' - You only have 12 chances to guess the code. Clues are given each guess'
    puts "\nCLUE SYMBOLS:"
    puts "'#{'+'.colorize(:red)}' means #{'RIGHT COLOR'.colorize(:green)} AND #{'RIGHT PLACE'.colorize(:green)}"
    puts "'#{'+'.colorize(:white)}' means #{'RIGHT COLOR'.colorize(:green)} AND #{'WRONG PLACE'.colorize(:red)}"
    puts "' ' means #{'WRONG COLOR'.colorize(:red)} AND #{'WRONG PLACE'.colorize(:red)}"
  end
end
