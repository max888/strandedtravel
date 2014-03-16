class Destination < ActiveRecord::Base
  attr_accessible :city, :country, :description, :latitude, :longitude, :user_id
end
