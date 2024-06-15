# frozen_string_literal: true

require('colorize')
require_relative('lib/board')
require_relative('lib/game')

# Game Setup
BOARD = Board.new.freeze
GAME = Game.new(BOARD)
GAME.game_start
