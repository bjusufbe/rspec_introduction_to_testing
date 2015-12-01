require 'rest_client'
require 'pp'
require 'json'
require 'yaml'
require 'uri'

class WSConnector
	attr_accessor :base_url, :api_key, :geocoding_endpoint, :distance_endpoint, :places_endpoint
	attr_accessor :address_latlong, :destination_address, :distance_data

	def initialize
		properties = YAML.load(File.open('./config/properties.yaml'))
    @base_url = properties['properties']['base_url']
    @api_key = properties['properties']['api_key']
    @geocoding_endpoint = properties['properties']['geocoding_endpoint']
    @distance_endpoint = properties['properties']['distance_endpoint']
    @places_endpoint = properties['properties']['places_endpoint']
	end

	def get_latlong_by_address(address_name)
		response = RestClient.get(self.base_url + self.geocoding_endpoint + URI.encode("?address=#{address_name}&key=#{self.api_key}"))
		result = JSON.parse(response)
		latitude = result["results"][0]['geometry']['location']['lat']
		longitude = result["results"][0]['geometry']['location']['lng']
		@address_latlong = { latitude: latitude, longitude: longitude }
	end

	def get_first_place_in_radius_by_latlong_and_category(latitude, longitude, radius, category)
		response = RestClient.get(self.base_url + self.places_endpoint + URI.encode("?location=#{latitude},#{longitude}&radius=#{radius}&types=#{category}&key=#{self.api_key}"))
		result = JSON.parse(response)
		@destination_address = result['results'][0]['vicinity']
	end

	def get_distance_between_two_addresses(address_name_1, address_name_2, mode)
		response = RestClient.get(self.base_url + self.distance_endpoint + URI.encode("?origins=#{address_name_1}&destinations=#{address_name_2}&mode=#{mode}&key=#{self.api_key}"))
		result = JSON.parse(response)
		destination_address = result['destination_addresses'].first
		origin_address = result['origin_addresses'].first
		distance = result['rows'][0]['elements'][0]['distance']['text']
		@distance_data = { destination_address: destination_address, origin_addresses: origin_address, distance: distance }
	end
end
