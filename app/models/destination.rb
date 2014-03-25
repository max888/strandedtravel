class Destination < ActiveRecord::Base
  attr_accessible :city, :country, :description, :latitude, :longitude, :user_id, :photo, :photo_cache, :remove_photo

  has_many :activities

  belongs_to :user

  geocoded_by :city
  after_validation :geocode
  mount_uploader :photo, DestinationImageUploader

  validates :city, presence: true, :length => {:minimum => 2, :maximum => 150 }
  validates :country, presence: true, :length => {:minimum => 2, :maximum => 150 }
  validates :description, presence: true, :length => { :minimum => 3, :maximum => 800 }
  validates :photo, presence: true

  
end
