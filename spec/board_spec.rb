require 'board'

describe Board do
  
  it { is_expected.to respond_to :place_ship }

  it 'places the ship on the board' do
    ship = double :ship
    
    expect(ship).to receive(:place)
    
    subject.place_ship ship
  end

  it 'returns the location of the ship' do 
    ship = double :ship
    allow(ship).to receive(:place) { true }
    expect(subject.place_ship ship).to eq "(1,1)"
  end 

end