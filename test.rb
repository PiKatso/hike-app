require "sinatra/activerecord"
require "json"
require "nokogiri"
require "open-uri"
require "pry"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

obj = JSON.parse(File.read('example.json'))

data  = []

obj["results"].each do |key,value|
  name = key
  distance = value["printouts"]["Distance"][0]
  elevation = value["printouts"]["Elevation gain"][0]
  difficulty = value["printouts"]["Difficulty"][0]
  url = value["fullurl"]
  data.push({
    name: name,
    distance: distance,
    elevation: elevation,
    difficulty: difficulty,
    url: url,
    lat: nil,
    lon: nil
  })
end

data.each do |hike|
  page = Nokogiri::HTML(open("#{hike.fetch(:url)}"))
  url = page.css('div#mw-content-text ul li')[0].element_children[0].attributes["href"].value
  page = Nokogiri::HTML(open("http://www.oregonhikers.org#{url}"))
  hike[:lat] = page.css('div#mw-content-text ul')[0].children[0].children.text.scan(/(-?\d+.\d+)/)[0][0]
  hike[:lon] = page.css('div#mw-content-text ul')[0].children[1].children.text.scan(/(-?\d+.\d+)/)[0][0]
end

data.each do |hike|
  Hike.create({
    name: hike[:name],
    distance: hike[:distance],
    elevation: hike[:elevation],
    difficulty: hike[:difficulty],
    url: hike[:url],
    latitude: hike[:lat],
    longitude: hike[:lon]
    })
end
