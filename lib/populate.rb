require "json"
require "nokogiri"
require "open-uri"

module Populate
  def self.regions
    page = Nokogiri::HTML(open("http://www.oregonhikers.org/tools/hikefinder/hike_finder.php"))
    regions = page.css("select[name='area'] option").children.children.map{|a|a.text}
  end

  def self.features
    page =  Nokogiri::HTML(open("http://www.oregonhikers.org/tools/hikefinder/hike_finder.php"))
    features = page.css("input[name='options[]']").map{|i| i.attr("value")}
  end

  def self.create_features
    self.features.each do |name|
      Feature.create({name: name})
    end
  end

  def self.url (region, feature)
    "http://www.oregonhikers.org/w/index.php?title=Special%3AAsk&q=%5B%5BCategory%3A#{region.gsub(/\s/,"+")}%5D%5D%5B%5BCategory%3A#{feature.gsub(/\s/,"+")}%5D%5D&po=%3FDifficulty%0D%0A%3FDistance%0D%0A%3FElevation+gain%0D%0A&eq=yes&p%5Bformat%5D=json&sort%5B0%5D=&order%5B0%5D=ASC&sort_num=&order_num=ASC&p%5Blimit%5D=500&p%5Boffset%5D=&p%5Blink%5D=none&p%5Bsort%5D=&p%5Border%5D%5Bascending%5D=1&p%5Bheaders%5D=hide&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=out&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&eq=yes"
  end

  def self.coords (url, axis)
    page = Nokogiri::HTML(open("#{url}"))
    url = page.css('div#mw-content-text ul li')[0].element_children[0].attributes["href"].value
    page = Nokogiri::HTML(open("http://www.oregonhikers.org#{url}"))
    case axis
    when :lat
      page.css('div#mw-content-text ul')[0].children[0].children.text.scan(/(-?\d+.\d+)/)[0][0]
    when :lon
      page.css('div#mw-content-text ul')[0].children[1].children.text.scan(/(-?\d+.\d+)/)[0][0]
    end
  end

  # TODO: refactor to capture region and feature from url
  def self.parse (url, region, feature)
    hikes = []
    out = open(url).read
    if out.length > 3
      input = JSON.parse(out)["results"]

      input.each do |name, value|
        url = value["fullurl"]
        hikes.push({
          name: name,
          distance: value["printouts"]["Distance"][0],
          elevation: value["printouts"]["Elevation gain"][0],
          difficulty: value["printouts"]["Difficulty"][0],
          url: url,
          latitude: self.coords(url, :lat),
          longitude: self.coords(url, :lon),
          region: region,
          feature: feature
          })
      end
    end
    hikes
  end

  def self.all
    hikes = []
    self.regions.each do |region|
      self.features.each do |feature|
        url = self.url(region, feature)
        data = self.parse(url, region, feature)
        hikes.push(data)
      end
    end
    hikes.flatten!
    hikes
  end

  def self.save_all
    hikes = self.all
    hikes.each do |data|
      hike = Hike.create({
        name: data[:name],
        latitude: data[:latitude],
        longitude: data[:longitude],
        description: data[:description],
        region_id: data[:region_id],
        distance: data[:distance],
        elevation: data[:elevation],
        difficulty: data[:difficulty],
        url: data[:url]
      })
      hike.features.push(Feature.find_by({name: data[:name]}))
      # TODO: add region addition code
    end
  end
end
