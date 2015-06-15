require 'board'

describe Board do
  
  it { is_expected.to respond_to :place_ship }

  it 'places the ship on the board' do
    ship = double :ship
    
    expect(ship).to receive(:place)
    
    subject.place_ship ship
  end

  it 'returns the location of the ship' do 
    ship = double :ship, size: 2
    allow(ship).to receive(:place) { true }
    expect(subject.place_ship ship, 1, 1).to eq "(1,1) to (1,2)"
  end 

  it 'has a grid width of 10' do
  	expect(subject.width).to eq 10
  end

  it 'has a grid height of 10' do
    expect(subject.height).to eq 10
  end


end