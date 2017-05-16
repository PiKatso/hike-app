require "spec_helper"

describe Hike do
  it { should belong_to :region }
  it { should have_and_belong_to_many :features }
  it { should have_and_belong_to_many :landmarks }


  describe "#weather" do
    it "reurns the current weather observation" do
      hike = Hike.create(name: "test hike", latitude: '45.54277', longitude: '-122.23769')
      expect(hike.weather).to be_a(String)
    end
  end

end

describe Feature do
  it { should have_and_belong_to_many :hikes }
end

describe Landmark do
  it { should have_and_belong_to_many :hikes }
end

describe Region do

end
