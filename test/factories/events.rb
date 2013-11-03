# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    description ""
    sequence(:start_time) {|c| Time.now + c.day}
    sequence(:end_time) {|c| start_time + c.hours }
    sequence(:name){|c| "Event_#{c}"}
   
    factory :event_with_club, :parent => :event do |event|
            club {FactoryGirl.create(:club)}
    end
  end
end
