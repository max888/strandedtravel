class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :destination_id, :name, :url, :user_id

  belongs_to :destination
  belongs_to :category
  
end
