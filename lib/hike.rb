class Hike < ActiveRecord::Base
  belongs_to :region
  has_and_belongs_to_many :landmarks
  has_and_belongs_to_many :features
  validates :name, uniqueness: true

  def weather
    geo_result = Geocoder.search("#{self.latitude},#{self.longitude}")
    data_size = geo_result[0].data['address_components'].length
    target = data_size - 1
    zip = geo_result[0].data['address_components'][target]['long_name']
    if /^\d{5}$/.match(zip).nil?
      target = data_size - 2
    end
    zip = geo_result[0].data['address_components'][target]['long_name']
    api_result = RestClient.get "http://api.wunderground.com/api/3df9e5569912899b/geolookup/conditions/q/#{zip}.json"
    jhash = JSON.parse(api_result)
    jhash['current_observation']['weather']
  end

end
