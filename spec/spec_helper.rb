ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test
set :root, Dir.pwd

require "capybara/rspec"
Capybara.app = Sinatra::Application
set :show_exceptions, false
require "./app"

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file}
 
# RSpec.configure do |config|
#   config.before :all do
#     Populate.run("http://www.oregonhikers.org/w/index.php?title=Special%3AAsk&q=%5B%5BCategory%3APortland+Area%5D%5D%5B%5BCategory%3AUrban+Hikes%5D%5D&po=%3FDifficulty%0D%0A%3FDistance%0D%0A%3FElevation+gain%0D%0A&eq=yes&p%5Bformat%5D=json&sort%5B0%5D=&order%5B0%5D=ASC&sort_num=&order_num=ASC&p%5Blimit%5D=5&p%5Boffset%5D=&p%5Blink%5D=all&p%5Bsort%5D=&p%5Bheaders%5D=show&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=%E2%80%A6+further+results&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&eq=yes")
#   end
# end