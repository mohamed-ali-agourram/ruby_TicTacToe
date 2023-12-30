# game.rb
class Game
  def initialize(players)
    @map = Array.new(3) { Array.new(3) { " " } }
    @players = players
  end

  def show_map
    @map.each_with_index do |row, index|
      puts row.join(" | ")
      puts "--+---+--" if index != @map.length - 1
    end
  end

  def show_scores
    for player in @players
      p "#{player.name} #{player.weapon}"
    end
  end

  def start_game
    weapon = ""
    loop do
      print "#{@players[0].name} pick a weapon(X,O): "
      weapon = gets.chomp.upcase
      if ["X", "O"].include? weapon
        @players[0].weapon = weapon
        @players[1].weapon = weapon == "O" ? "X" : "O"
        break
      end
    end
  end
end
