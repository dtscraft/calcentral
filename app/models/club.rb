class Club < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :events 
  has_many :categories
end
