require "bundler/setup"
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
require 'pry'
also_reload('lib/**/*.rb')

# NOTE: comment Populate.run when running tests
# Populate.run

get('/') do
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
  weather = @hike.forecast
  @current_weather = weather.shift
  @forecast = weather
  erb :hike
end

get '/features/:id' do
  feature_id = params['id']
  @feature = Feature.find(feature_id)
  erb :feature
end

get '/features' do
  erb :features
end

get '/search' do
  erb :search
end
