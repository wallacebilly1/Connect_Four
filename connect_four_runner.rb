# This is the runner for our Connect Four game!
# This beautiful game was designed by Billy, Jared, and Grant

# Can move to another file if so desired
require './lib/board.rb'
require './lib/game.rb'
require './lib/message.rb'
require './lib/player.rb'

game = Game.new

game.start