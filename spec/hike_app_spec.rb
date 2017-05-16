require "spec_helper"

describe Hike do
  it { should have_many :ratings }
  it { should belong_to :region }
  it { should have_and_belong_to_many :features }
  it { should have_and_belong_to_many :landmarks }
<<<<<<< HEAD

  # describe "#weather" do
  #   it "reurns the current weather observation" do
  #     new_hike = Hike.create({name: "awesome hike", latitude: "45.54277", longitude: "-122.23769"})
  #
  #   end
  # end

end

describe Feature do
  it { should have_and_belong_to_many :hikes }
end

describe Landmark do
  it { should have_and_belong_to_many :hikes }
end

describe Region do

=======
end

describe Feature do
  it { should have_and_belong_to_many :hikes }
end

describe Landmark do
  it { should have_and_belong_to_many :hikes }
end

describe HikeRating do
  it { should belong_to :hike }
  it { should belong_to :rating }
end

describe Region do

>>>>>>> 00e2890d183469c66e65633206fcdc1bddf4baae

end
