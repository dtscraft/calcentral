require 'faker'

FactoryGirl.define do
  factory :page do |f|
    f.name { Faker::Name.name }
    f.description { Faker::Name.description }
    f.start_time { Faker::Name.start_time }
    f.end_time { Faker::Name.end_time }
  end
end

