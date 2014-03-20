class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :destination_id, :name, :url, :user_id

  belongs_to :destination
  belongs_to :category

  belongs_to :user

  acts_as_voteable

  before_validation :correct_url

  def correct_url
    self.url = "http://#{self.url}" unless self.url[/\Ahttp/]
  end
end

