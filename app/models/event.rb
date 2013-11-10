class Event < ActiveRecord::Base
  #http://guides.rubyonrails.org/active_record_querying.html#passing-in-arguments
  scope :find_by_category, ->(category){ includes(:club => :categories).where("categories.name = ?", category)}
  scope :find_by_club, ->(club){ includes(:club).where("clubs.name = ? ", club)}
  scope :chronological_order, order("start_time ASC")
  scope :reverse_chronological_order, order("start_time DESC")
  attr_accessible :description, :end_time, :name, :start_time, :facebook_id
  belongs_to :club
  has_many :categories, :through => :club, :source => :categories	
  def self.get_facebook_group_events(graph_id, user_access_token)
    MiniFB.get(user_access_token, graph_id , :type => "events")
  end
end
