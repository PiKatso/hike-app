require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/hike_app'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @urban_sprawl = Region.find(12)
  erb :index
end

get('/regions/:id') do
  region_id = params['id']
  @hikes = Hike.all.where({region_id: region_id})
  @region = Region.find(region_id)
  erb :region
end

get('/hikes/:id') do
  hike_id = params['id']
  @hike = Hike.find(hike_id)
  erb :hike
end
