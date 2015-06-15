class Ship

  def initialize
    @on_board = false
  end

  def placed?
    @on_board
  end

  def place
    @on_board = true
  end


end