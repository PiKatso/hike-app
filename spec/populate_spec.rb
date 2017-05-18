require "spec_helper"

describe "Populate" do
  describe ".regions" do
    it "returns a list of all available hiking regions" do
      # expect(Populate.regions.length).to eq 10
    end
  end

  describe ".features" do
    it "returns a list of all available hiking features" do
      # expect(Populate.features.length).to eq 33
    end
  end

  describe ".create_features" do
    it "saves all hike features to the database" do
      # Populate.create_features
      # expect(Feature.all.length).to eq 33
    end
  end

  describe ".url" do
    it "returns a link to data on hikes in the given region by feature" do
      # expect(Populate.url("Portland Area", "All Season Hikes")).to eq "http://www.oregonhikers.org/w/index.php?title=Special%3AAsk&q=%5B%5BCategory%3APortland+Area%5D%5D%5B%5BCategory%3AAll+Season+Hikes%5D%5D&po=%3FDifficulty%0D%0A%3FDistance%0D%0A%3FElevation+gain%0D%0A&eq=yes&p%5Bformat%5D=json&sort%5B0%5D=&order%5B0%5D=ASC&sort_num=&order_num=ASC&p%5Blimit%5D=500&p%5Boffset%5D=&p%5Blink%5D=none&p%5Bsort%5D=&p%5Border%5D%5Bascending%5D=1&p%5Bheaders%5D=hide&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=out&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&eq=yes"
    end
  end

  describe ".parse" do
    it "returns a list of information about each hike from a given url" do
      # url = Populate.url("Portland Area", "All Season Hikes")
      # hikes = Populate.parse(url, "Portland Area", "All Season Hikes")
      # expect(hikes[0][:name]).to eq "Alder Ridge Loop Hike"
      # expect(hikes.length).to eq 97
    end
  end

  describe ".coords" do
    it "returns the latitude or longitude of a given hike" do
      # url = "http://www.oregonhikers.org/field_guide/Alder_Ridge_Loop_Hike"
      # expect(Populate.coords(url, :lon)).to eq "-122.30071"
    end
  end

  describe ".all" do
    it "returns a list of all hikes" do
      # expect(Populate.all.length).to eq 3876
    end
  end

  describe ".save_all" do
    it "saves all hikes to the database" do
      # Populate.save_all
      # expect(Hike.all.length).to eq 3876
    end
  end
end
