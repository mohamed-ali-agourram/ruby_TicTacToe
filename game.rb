# game.rb
class Game
  def initialize(players)
    @map = Array.new(3) { Array.new(3) { " " } }
    @players = players
    @active_player = players[0]
  end

  def show_map
    @map.each_with_index do |row, index|
      puts row.join(" | ")
      puts "--+---+--" if index != @map.length - 1
    end
  end

  def check_pattern
    # Diagonal checks
    if @map[0][0] == @map[1][1] && @map[1][1] == @map[2][2] && @map[0][0] != " "
      return [true, @map[0][0]]
    elsif @map[0][2] == @map[1][1] && @map[1][1] == @map[2][0] && @map[0][2] != " "
      return [true, @map[0][2]]
    end

    # Row checks
    (0..2).each do |i|
      if @map[i][0] == @map[i][1] && @map[i][1] == @map[i][2] && @map[i][0] != " "
        return [true, @map[i][0]]
      end
    end

    # Column checks
    (0..2).each do |i|
      if @map[0][i] == @map[1][i] && @map[1][i] == @map[2][i] && @map[0][i] != " "
        return [true, @map[0][i]]
      end
    end

    [false]
  end

  def game_ended?
    if check_pattern[0]
      @players.each do |player|
        if player.weapon == check_pattern[1]
          p "#{player.name} YOU WON!"
        end
      end
      return true
    end
    @map.each do |row|
      return false if row.include?(" ")
    end
    true
    p "GAME ENDED! WITH NO WINNER"
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

    position = []
    show_map
    while game_ended? == false
      row = nil
      col = nil
      loop do
        while !(1..3).include? row
          print "#{@active_player.name} pick a row:(between 1 and 3) "
          row = gets.chomp.to_i
        end
        while !(1..3).include? col
          print "#{@active_player.name} pick a column:(between 1 and 3) "
          col = gets.chomp.to_i
        end
        position << row - 1
        position << col - 1
        if @map[position[0]][position[1]] == " "
          break
        else
          p "POSITION NOT EMPTY!"
          row = nil
          col = nil
          position = []
        end
      end
      @map[position[0]][position[1]] = @active_player.weapon
      position = []
      @active_player = @active_player == @players[0] ? @players[1] : @players[0]
      show_map
    end
  end
end
