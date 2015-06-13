require 'airport'

describe Airport do 
	it 'A new airport must allow planes to land' do 
		expect(subject).to respond_to :land_plane
	end

	it 'A new Airport must allow planes to land' do
		plane=Plane.new
		expect(subject.land_plane plane).to eq plane
	end

	it 'A plane must not be flying after landing' do 
		plane=Plane.new
		subject.land_plane plane
		expect(plane).to_not be_flying
	end
end