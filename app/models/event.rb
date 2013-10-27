class Event < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time
  belongs_to :club
  has_many :categories, :through => :club, :source => :categories	
end
