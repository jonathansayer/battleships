class Ship

  attr_accessor :x
  attr_accessor :y

  def initialize
    @on_board = false
    @size = 2
  end

  def placed?
    @on_board
  end

  def place
    @on_board = true
    if (@orientation == "horizontal")
      "(#{ x },#{ y }) to (#{ x + 1 },#{ y })" 
    elsif (@orientation == "vertical")
      "(#{ x },#{ y }) to (#{ x },#{ y + 1 })"
    end
  end

  def position
    puts"Enter x co-ordinate: "
    @x=gets.chomp.to_i
    puts"Enter y co-ordinate: "
    @y=gets.chomp.to_i
    puts"Orientation (vertical/horizontal): "
    @orientation=gets.chomp 
  end

end