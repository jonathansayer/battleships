require_relative 'ship'

class Board

  DEFAULT_WIDTH = 10
  DEFAULT_HEIGHT = 10
  
  attr_reader :width
  attr_reader :height

  def initialize
    @width = DEFAULT_WIDTH
    @height = DEFAULT_HEIGHT
    @ships = []
  end

  def place_ship ship, x, y, orientation
  	fail 'No more space' if @ships.count >= 5
  	ship.coordinates x, y, orientation
    ship.place
    limit ship
    @ships << ship
  end

  def limit ship 
    @ships.each do |boat|
      fail 'There is already a ship of that size' if boat.size == ship.size
    end

  end 

end
