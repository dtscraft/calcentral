class Category < ActiveRecord::Base
  attr_accessible :type
  has_many :clubs
end
