class Hike < ActiveRecord::Base
  has_one :rating
  belongs_to :region
  has_and_belongs_to_many :landmarks
  has_and_belongs_to_many :features
  has_many :hike_ratings
  has_many :ratings, through: :hike_ratings
  # has_many :hikes_landmarks
  # has_many :features_hikes
  # has_many :features, through: :features_hikes
  # has_many :landmarks, through: :hikes_landmarks
end

class Landmark < ActiveRecord::Base
  has_and_belongs_to_many :hikes
  # has_many :hikes_landmarks
  # has_many :hikes, through: :hikes_landmarks
end

class Feature < ActiveRecord::Base
  has_and_belongs_to_many :hikes
  # has_many :hikes_landmarks
  # has_many :hikes, through: :hikes_landmarks
end

class Rating < ActiveRecord::Base
  has_many :hike_ratings
  has_many :hikes, through: :hike_ratings
end

class Region < ActiveRecord::Base
  has_many :hikes
end

class HikeRating < ActiveRecord::Base
  belongs_to :hike
  belongs_to :rating
end

# class HikeLandmark < ActiveRecord::Base
#   belongs_to :hike
#   belongs_to :landmark
# end
#
# class HikeFeature < ActiveRecord::Base
#   belongs_to :hike
#   belongs_to :feature
# end
