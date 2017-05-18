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

get '/search' do
  erb :search
end

get '/search1' do
  search = params['search1'].upcase
  @hikes = Hike.where("upper(name) like ?", "%#{search}%").order("name")
  erb :search_results
end

# get '/search2' do
#   search = params['search2']
#   if search > 10
#     @hikes = Hike.where(distance: > 10)
#   elsif search > 5
#     @hikes = Hike.where(distance: > 5 && <= 10)
#   elsif search > 2
#     @hikes = Hike.where(distance: > 2 && <= 5)
#   else
#     @hikes = Hike.where(distance: <= 2)
#   end
#   erb :search_results
# end

get '/search3' do
  search = params['search3']
  @hikes = Hike.where
  erb :search_results
end

get '/search4' do
  search = params['search4']
  @hikes = Hike.where
  erb :search_results
end

get '/search5' do
  search = params['search5'].upcase
  @hikes = Hike.where
  erb :search_results
end

get '/search6' do
  search = params['search6']
  @hikes = Hike.where
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
