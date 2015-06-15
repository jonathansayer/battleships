class Ship

  attr_accessor :x
  attr_accessor :y
  attr_accessor :orientation

  def initialize
    @on_board = false
    @size = 2
  end

  def placed?
    @on_board
  end

  def coordinates x, y, orientation
    @x = x
    @y = y
    @orientation = orientation.to_s
  end

  def display
    if (@orientation == "horizontal")
      "(#{ @x },#{ @y }) to (#{ @x + (@size - 1) },#{ @y })" 
    elsif (@orientation == "vertical")
      "(#{ @x },#{ @y }) to (#{ @x },#{ @y + (@size - 1 )})"
    end
  end
  
  def place 
    @on_board = true
  end

end