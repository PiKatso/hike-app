require "bundler/setup"
Bundler.require :default

# NOTE: check laptop
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
require 'pry'


also_reload('lib/**/*.rb')

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
  erb :hike
end

get '/map' do
  erb :map
end

get '/search' do
  erb :search
end
