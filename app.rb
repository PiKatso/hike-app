require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/hike_app'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
