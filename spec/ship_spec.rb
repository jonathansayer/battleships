require 'ship'

describe Ship do
  
  it {is_expected.to_not be_placed}

  it 'places a ship' do 
    expect(subject.place).to eq true
  end
  
  it 'outputs the chosen coordinates' do
    subject.coordinates 1, 1, 'horizontal'
    expect(subject.display).to eq '(1,1) to (2,1)' 
  end


end