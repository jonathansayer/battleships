class Ship

  attr_accessor :x
  attr_accessor :y
  attr_accessor :orientation
  attr_accessor :size

  def initialize size
    fail 'Wrong size ship' if size >= 5 || size <= 1
    @size = size
  end

  def coordinates x, y, orientation
    @x = x
    @y = y
    @orientation = orientation
  end

  def display
    if (@orientation == "horizontal")
      "(#{ @x },#{ @y }) to (#{ @x + (@size - 1) },#{ @y })" 
    elsif (@orientation == "vertical")
      "(#{ @x },#{ @y }) to (#{ @x },#{ @y + (@size - 1 )})"
    end
  end


  
  

 # def hit hit_x, hit_y
  #  hit_array = [hit_x,hit_y] 
  #end


end