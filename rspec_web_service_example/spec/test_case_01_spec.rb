require './lib/wsconnector'

describe "Test Case 01: Geocode address, take lat/long and find place with food category in radius of 500m and calculate distance to it (drive/walk)" do
	before(:all) do
		@source_address = "Zmaja od Bosne 28"
		@radius = "500"
		@category = "food"
		@wsconnector = WSConnector.new
	end

	context "Geocode predefined address" do
		it "geocodes address and retrieves lat/long" do
			address_latlong = @wsconnector.get_latlong_by_address(@source_address)
			expect(address_latlong.values).not_to include(nil)
		end
	end

	context "Find first place with food type in radius of 500m" do
		it "finds place with food type" do
			destination_address = @wsconnector.get_first_place_in_radius_by_latlong_and_category(@wsconnector.address_latlong[:latitude], @wsconnector.address_latlong[:longitude], @radius, @category)
			expect(destination_address).not_to eq(nil)
		end
	end

	context "Calculate walking distance between starting address and this address" do
		it "calculates distance between addresses" do
			distance_data = @wsconnector.get_distance_between_two_addresses(@source_address, @wsconnector.destination_address, 'walking')
			expect(distance_data[:distance]).not_to eq(nil)
			expect(distance_data[:origin_addresses]).to include(@source_address)
			expect(distance_data[:destination_address]).to include(@wsconnector.destination_address)
		end
	end

	context "Calculate driving distance between starting address and this address" do
		it "calculates distance between addresses" do
			distance_data = @wsconnector.get_distance_between_two_addresses(@source_address, @wsconnector.destination_address, 'drive')
			expect(distance_data[:distance]).not_to eq(nil)
			expect(distance_data[:origin_addresses]).to include(@source_address)
			expect(distance_data[:destination_address]).to include(@wsconnector.destination_address)
		end
	end
end