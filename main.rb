# main.rb
require_relative "player"
require_relative "game"

game = Game.new([Player.new, Player.new(2)])
game.start_game
game.show_scores
