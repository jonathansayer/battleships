class Board

  DEFAULT_WIDTH = 10
  DEFAULT_HEIGHT = 10
  
  attr_accessor :x
  attr_accessor :y
  attr_reader :width
  attr_reader :height

  def initialize
    @width = DEFAULT_WIDTH
    @height = DEFAULT_HEIGHT
  end

  def place_ship ship, x, y, orientation
    ship.place
    if (orientation == "horizontal")
      "(#{ x },#{ y }) to (#{ x + 1 },#{ y })" 
    elsif (orientation == "vertical")
      "(#{ x },#{ y }) to (#{ x },#{ y + 1 })"
    end
  end

end
