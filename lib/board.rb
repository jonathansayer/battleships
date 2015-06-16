require_relative 'ship'

class Board

  DEFAULT_WIDTH = 10
  DEFAULT_HEIGHT = 10
  
  attr_reader :width
  attr_reader :height
  attr_accessor :ships
  attr_accessor :hits
  attr_accessor :misses


  def initialize
    @width = DEFAULT_WIDTH
    @height = DEFAULT_HEIGHT
    @ships = []
    @hits = []
    @misses = []
  end

  def place_ship ship, x, y, orientation
  	fail 'No more space' if @ships.count >= 5
    ship.x = x
    ship.y = y
    ship.x2 = x
    ship.y2 = y
    ship.y2 = ship.y + ((ship.size)-1) if orientation == 'vertical'
    ship.x2 = ship.x + ((ship.size)-1) if orientation == 'horizontal'
    fail 'Cannot place here' if outside_board? ship
    limit_by_size ship
    ships << ship
  end

  def outside_board? ship
    if ship.x > @width
      true
    elsif ship.x2 > @width 
      true 
    elsif ship.y > @height 
      true
    elsif ship.y2 > @height
      true
    else
      false
    end
  end

  def limit_by_size ship 
    ships.each do |boat|
      fail 'There is already a ship of that size' if boat.size == ship.size
    end
  end 

  def receive_hit x, y
    hit = false
    ships.each do |ship|
      hit = true if ship.x == x and ship.y == y
    end
    if hit
      store_hit x, y
      return 'hit!'
    else
      store_miss x, y
      return 'miss!'
    end
  end

  def store_hit x, y
    fail "Already guessed" if hits.include?([x, y])
    hits << [x, y] 
  end

  def store_miss x, y
    fail "Already guessed" if misses.include?([x, y])
    misses << [x, y]
  end

  def win?
    total_length = 0
    ships.each do |ship|
      total_length+=ship.size
    end
    if total_length == @hits.length
      true
    else
      false
    end
  end
end
