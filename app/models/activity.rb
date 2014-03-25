class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :destination_id, :name, :url, :user_id

  belongs_to :destination
  belongs_to :category

  belongs_to :user

  acts_as_voteable

  before_validation :correct_url

  validates :name, presence: true, :length => {:minimum => 2, :maximum => 150 }
  validates :category_id, presence: true
  
  def correct_url
    self.url = "http://#{self.url}" if !self.url[/\Ahttp/] && !url.blank?
  end
end

