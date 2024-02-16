require 'pry'
require 'rspec'

require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end