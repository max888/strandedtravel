class Destination < ActiveRecord::Base
  attr_accessible :city, :country, :description, :latitude, :longitude, :user_id, :photo, :photo_cache, :remove_photo

  has_many :activities

  belongs_to :user

  mount_uploader :photo, DestinationImageUploader
  
end
