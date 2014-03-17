class Destination < ActiveRecord::Base
  attr_accessible :city, :country, :description, :latitude, :longitude, :user_id, :photo

  has_many :activities

  mount_uploader :photo, DestinationImageUploader
  
end
