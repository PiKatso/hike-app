require "bundler/setup"
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  # geo_result = Geocoder.search("45.54277,-122.23769")
  # zip = geo_result[0].data['address_components'].last['long_name']
  # api_result = RestClient.get "http://api.wunderground.com/api/3df9e5569912899b/geolookup/conditions/q/#{zip}.json"
  # jhash = JSON.parse(api_result)
  # @current_weather = jhash['current_observation']['weather']
  erb :index
end

get('/regions/:region') do
  @region = params['region']
  @hikes = Hike.all
  # @region = Region.find(region_id)
  erb :region
end

get('/hikes/:id') do
  hike_id = params['id']
  @hike = Hike.find(hike_id)
  erb :hike
end

get '/map' do
  erb :map
end

get '/search' do
  erb :search
end
