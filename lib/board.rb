class Board

  attr_accessor :x
  attr_accessor :y

  def place_ship ship, x=1, y=1
    ship.place
    "(#{x},#{y})"
  end

end
