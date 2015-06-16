require 'board'

describe Board do

  before(:each) do
    ship = double :ship
    allow(ship).to receive(:x) {9}
    allow(ship).to receive(:y) {3}
    allow(ship).to receive(:x2) {11}
    allow(ship).to receive(:y2) {3}
    allow(ship).to receive(:x=) {9} 
    allow(ship).to receive(:y=) {3}
    allow(ship).to receive(:x2=) {11} 
    allow(ship).to receive(:y2=) {3}
  end
  
  it { is_expected.to respond_to :place_ship }


  it 'has a grid width of 10' do
  	expect(subject.width).to eq 10
  end

  it 'has a grid height of 10' do
    expect(subject.height).to eq 10
  end
   
  xit 'only holds 5 ships' do
    5.times do |size|
      ship = double :ship, { size: size }
      allow(ship).to receive(:x=) {1}
      allow(ship).to receive(:y=) {1}
      subject.place_ship ship, 1, 1, 'vertical'
    end
    expect{subject.place_ship ship, 1, 1, 'vertical'}.to raise_error 'No more space'
  end

  it 'can only hold one ship of each size' do  
    ship2 = double :ship 
    allow(ship2).to receive(:x=) {1} 
    allow(ship2).to receive(:y=) {2}
    subject.place_ship ship, 3, 4, 'horizontal'
    expect{subject.place_ship ship2, 1, 2, 'vertical'}.to raise_error "There is already a ship of that size"
  end

  it 'Allows a ship to be hit' do 
    ship = double :ship
  
    subject.place_ship ship, 1, 1, 'horizontal'
    expect(subject.receive_hit 1, 1).to eq 'hit!' 
  end

  it 'Can return miss' do 
    expect(subject.receive_hit 1, 1).to eq 'miss!'
  end

  it 'return Winner when all ships have been sunk' do 
    ship = double :ship, size: 1
    allow(ship).to receive(:x=) {1} 
    allow(ship).to receive(:y=) {1}
    allow(ship).to receive(:x) {1}
    allow(ship).to receive(:y) {1}
    subject.place_ship ship, 1, 1, 'horizontal'
    subject.receive_hit 1, 1
    expect(subject.win?).to eq true
  end

  it 'doesnt allow two hits (same for misses)' do
    ship = double :ship
    allow(ship).to receive(:x=) {1} 
    allow(ship).to receive(:y=) {1}
    allow(ship).to receive(:x) {1}
    allow(ship).to receive(:y) {1}
    subject.place_ship ship, 1, 1, 'horizontal'
    subject.receive_hit 1, 1
    expect{ subject.receive_hit 1, 1 }.to raise_error 'Already guessed'
  end

  it 'doesnt allow any ships to be placed outside of the board' do 
    ship = double :ship, size: 3
    allow(ship).to receive(:x) {9}
    allow(ship).to receive(:y) {3}
    allow(ship).to receive(:x2) {11}
    allow(ship).to receive(:y2) {3}
    allow(ship).to receive(:x=) {9} 
    allow(ship).to receive(:y=) {3}
    allow(ship).to receive(:x2=) {11} 
    allow(ship).to receive(:y2=) {3}
    expect{ subject.place_ship ship, 9, 3, 'horizontal' }.to raise_error "Cannot place here"
  end





end