require 'board'

describe Board do
  
  it { is_expected.to respond_to :place_ship }

  it 'To return the location of the ship' do 
    ship = double :ship
    expect(subject.place_ship ship).to eq "(1,1)"
  end 

end