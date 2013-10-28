require 'spec_helper'

describe Api::Callink::EventsController do
    before(:each) do
        (0..5).each{|i|
            club = Club.create!({ name: "Club_#{i}", description: "Description_#{i}"})
            category = Category.find_by_name("Club_#{i % 3 }"}) || Category.create!({ name: "Club_#{i % 3 }"})
            event = Event.create!({ name: "Event_#{i}", description: "Description_#{i}", start_time: (Time.now + i.day), end_time: (Time.now + i.day + i.hours) })
            club.events << event and club.category << category and club.save!;
        }
    end
    describe "#search" do
        it "should return all events for empty query" do
        end
        it "should return events with matching category" do
        end
        it "should return events with matching club" do
        end
    end

end
