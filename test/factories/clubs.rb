# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do 
  factory :club do
    
    sequence(:name){|c| "Club_#{c}"}
    sequence(:description){Faker::Lorem.paragraphs(1+ Kernel.rand(5)).join("\n").slice(0,255) }

    factory :club_with_categories, :parent => :club do|club|
      categories {create_list :category,3}
    end 

  end
end


