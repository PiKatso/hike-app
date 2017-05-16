require "json"
require "nokogiri"
require "open-uri"

module Populate

  def self.run (url="http://www.oregonhikers.org/w/index.php?title=Special%3AAsk&q=%5B%5BCategory%3APortland+Area%5D%5D%5B%5BCategory%3AUrban+Hikes%5D%5D&po=%3FDifficulty%0D%0A%3FDistance%0D%0A%3FElevation+gain%0D%0A&eq=yes&p%5Bformat%5D=json&sort%5B0%5D=&order%5B0%5D=ASC&sort_num=&order_num=ASC&p%5Blimit%5D=50&p%5Boffset%5D=&p%5Blink%5D=all&p%5Bsort%5D=&p%5Bheaders%5D=show&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=%E2%80%A6+further+results&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&eq=yes")
    tempfile = open(url)

    obj = JSON.parse(File.read(tempfile))

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

  end
end
