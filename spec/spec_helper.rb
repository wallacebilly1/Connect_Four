require 'pry'
require 'rspec'

require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'
require './lib/message.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end