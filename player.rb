# player.rb
class Player
  attr_accessor :name
  attr_accessor :score
  attr_accessor :weapon

  def initialize(order = 1)
    @order = order
    @score = 0
    @weapon = ""
    @name = ""
    while @name == ""
      print "Hi Player #{@order} What's your name: "
      @name = gets.chomp
    end
  end

  def play
    p "#{@name} is playing..."
  end
end
