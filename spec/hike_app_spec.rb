require "spec_helper"

describe Hike do
  it { should have_many :ratings }
  it { should belong_to :region }
  it { should have_and_belong_to_many :features }
  it { should have_and_belong_to_many :landmarks }
end

describe Feature do

end

describe Landmark do

end
