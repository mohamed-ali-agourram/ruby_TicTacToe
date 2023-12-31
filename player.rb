# player.rb
class Player
  attr_accessor :name
  attr_accessor :weapon

  def initialize(order = 1)
    @order = order
    @weapon = ""
    @name = ""
    while @name == ""
      print "Hi Player #{@order} What's your name: "
      @name = gets.chomp
    end
  end
end
