require "hike_app"
require "rspec"
require "pry"

ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test
set :root, Dir.pwd

require "capybara/rspec"
Capybara.app = Sinatra::Application
set :show_exceptions, false
require "./app"

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file}

test_region = Region.create({name: "urban sprawl"})
test_rating = Rating.create({rating_num: 5, description: "very difficult hike"})
test_hike = Hike.create({name: "Holman Lane Loop Hike", latitude: "45.5335", longitude: "-122.7331", description: "This short loop on the southern fringes of vast Forest Park encompasses some of the original acreage of the now 5,100 acre public property.", rating_id: test_rating.id, region_id: test_region.id, distance: "2.3 miles", elevation: "815 feet"})

test_hike_2 = Hike.create({name: "Active Volcano Sacrifice Hike", latitude: "45.5335", longitude: "-122.7331", description: "This short loop on the southern fringes of vast Forest Park encompasses some of the original acreage of the now 5,100 acre public property.", rating_id: test_rating.id, region_id: test_region.id, distance: "2.3 miles", elevation: "815 feet"})

test_hike_3 = Hike.create({name: "Bird People Sky Hike", latitude: "45.5335", longitude: "-122.7331", description: "This short loop on the southern fringes of vast Forest Park encompasses some of the original acreage of the now 5,100 acre public property.", rating_id: test_rating.id, region_id: test_region.id, distance: "2.3 miles", elevation: "815 feet"})
erb(:index)
