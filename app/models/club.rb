class Club < ActiveRecord::Base
  attr_accessible :description, :name, :facebook_id
  has_many :events 
  has_many :categories
end
