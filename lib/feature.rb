class Feature < ActiveRecord::Base
  has_and_belongs_to_many :hikes
  validates :name, uniqueness: true
end
