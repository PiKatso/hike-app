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

