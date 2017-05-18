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
  @features = Feature.all
  erb :features
end

get '/random' do
  weather = @hike.forecast
  @current_weather = weather.shift
  @forecast = weather
  @hike = Hike.all[rand(Hike.count)]
  erb :hike
end

get '/search' do
  erb :search
end

get '/search1' do
  search = params['search1'].upcase
  @hikes = Hike.where("upper(name) like ?", "%#{search}%").order("name")
  erb :search_results
end

get '/search2' do
  search = params['search2']
  @hikes = Hike.all.select do |hike|
    hike.distance.to_f <= search.to_f
  end
  erb :search_results
end


get '/search3' do
  search = params['search3']
  @hikes = Hike.all.select do |hike|
    hike.elevation.to_f <= search.to_f
  end
  erb :search_results
end

get '/search4' do
  search = params['search4']
  @hikes = Hike.all.select do |hike|
    hike.difficulty == search
  end
  erb :search_results
end

get '/search5' do
  search = params['search5']
  @hikes = Hike.all.select do |hike|
    hike.region == search
  end
  erb :search_results
end

get '/search6' do
  binding.pry
  features = params.fetch("features")
  @hikes = Hike.all.select do |hike|
    hike_features = hike.features.map{|f| f.name}
    features.any? {|feature| hike_features.include?(feature)}
  end
  erb :search_results
end

# REGION ROUTES

get('/portland') do
  @region = "Portland Area"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/willamette-valley') do
  @region = "Willamette Valley"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/oregon-coast') do
  @region = "Oregon Coast"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/columbia-gorge') do
  @region = "Columbia River Gorge"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/mount-hood') do
  @region = "Mount Hood"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/central') do
  @region = "Central Oregon"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/southern') do
  @region = "Southern Oregon"
  @hikes = Hike.where({region: @region})
  erb :region
end

get('/eastern') do
  @region = "Eastern Oregon"
  @hikes = Hike.where({region: @region})
  erb :region
end
