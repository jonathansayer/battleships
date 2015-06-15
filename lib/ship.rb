class Ship

  def initialize
    @on_board = false
    @size = 2
  end

  def placed?
    @on_board
  end

  def place
    @on_board = true
  end


end