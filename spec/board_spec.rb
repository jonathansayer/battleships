require 'board'

describe Board do
  
  it { is_expected.to respond_to :place_ship }

  it 'places the ship on the board' do
    ship = double :ship
    allow(ship).to receive(:coordinates)
    expect(ship).to receive(:place)
    
    subject.place_ship ship ,1 ,1 ,'vertical'
  end

  xit 'returns the location of the ship' do 
    ship = double :ship, size: 2
    allow(ship).to receive(:place) { true }
    expect(subject.place_ship ship).to eq "(1,1) to (2,1)"
  end 

  it 'has a grid width of 10' do
  	expect(subject.width).to eq 10
  end

  it 'has a grid height of 10' do
    expect(subject.height).to eq 10
  end
   
  it 'only holds 5 ships' do
    ship = double :ship
    allow(ship).to receive(:coordinates) {true} 
    allow(ship).to receive(:place) {true} 
    5.times {subject.place_ship ship, 1, 1, 'vertical'}
    expect{subject.place_ship ship, 1, 1, 'vertical'}.to raise_error 'No more space'
  end

end