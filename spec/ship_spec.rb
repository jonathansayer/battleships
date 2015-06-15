require 'ship'

describe Ship do
  
  it {is_expected.to_not be_placed}

  it 'When ship is placed, returns true' do 
    expect(subject.place).to eq true
  end
  

end