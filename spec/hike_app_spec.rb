require "spec_helper"

describe Hike do
  it { should have_many :ratings }
  it { should belong_to :region }
  it { should have_and_belong_to_many :features }
  it { should have_and_belong_to_many :landmarks }
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


end
