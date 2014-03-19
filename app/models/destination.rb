class Destination < ActiveRecord::Base
  attr_accessible :city, :country, :description, :latitude, :longitude, :user_id, :photo, :photo_cache, :remove_photo

  has_many :activities

  belongs_to :user

  geocoded_by :city
  after_validation :geocode
  mount_uploader :photo, DestinationImageUploader
  
end
