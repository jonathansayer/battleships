require 'ship'

describe Ship do

  it 'A new ship should have a given size' do 
    ship=Ship.new 4
    expect(ship.size).to eq 4
  end 

  it 'Send and error if ship is too big' do 
    expect{Ship.new 6}.to raise_error 'Wrong size ship'
  end

  it 'Send and error if ship is too small' do 
    expect{Ship.new 1}.to raise_error 'Wrong size ship'
  end

  it 'Knows its been hit' do 
    subject=Ship.new 3
    expect(subject.hit).to eq 1
  end

  it 'Knows its been sunk' do
    subject=Ship.new 2
    subject.hit
    expect(subject.hit).to eq true
  end
end