# Add a declarative step here for populating the DB with movies.

Given /the following events exist/ do |movies_table|
  movies_table.hashes.each do |e|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    club = nil
    if e.has_key? "club"
      club = Club.create! name: e['club'], description: e['club']
    end
    e = Event.create! name: e['events'], description: e['events'], start_time: e['start_time'], end_time: e['end_time']
    club.events << e and club.save! if club
  end
  #@title = Movie.all(:order => :title)
  #@date = Movie.all(:order => :release_date)
  #Movie.all.size.should == 4
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
  assert (Movie.find_by_title(arg1).director == arg2)
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  assert page.body.index(e1) < page.body.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following events: (.*)/ do |uncheck, events_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
end

Then /^(?:|]I )should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.find(:all).each do |movie|
    text = movie["title"]
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

And /^(?:|I )press Refresh/ do 
  #click_button(button)
end



Then /I should see events with type: (.*)/ do |type_list, events_table|
  #Movie.where(rating: rating_list.split(',')).find_each do |movie|
  events_table.hashes.each do |e|
  category = Category.find_by_name e['type']
  unless category.present?
    category = Category.create(name: e['type'])
  end
  club = Club.find_by_name(e['club'])
  unless club.present?
    club = Club.create!(name: e['club'])
  end
  unless club.categories.include? category
    club.categories << category and club.save!
  end
  e = Event.create! name: e['events'], description: e['events'], start_time: e['start_time'], end_time: e['end_time']
  club.events << e and club.save! if club

  if type_list.split(',').include?(e[:name])
    Event.new( e ).save!
  end
  end
end

Then /I should not see events with type: (.*)/ do |type_list, events_table|
  #Movie.where(rating: rating_list.split(',')).find_each do |movie|
  events_table.hashes.each do |e|
  category = Category.find_by_name e['type']
  unless category.present?
    category = Category.create(name: e['type'])
  end
  club = Club.find_by_name(e['club'])
  unless club.present?
    club = Club.create!(name: e['club'])
  end
  unless club.categories.include? category
    club.categories << category and club.save!
  end
  e = Event.create! name: e['events'], description: e['events'], start_time: e['start_time'], end_time: e['end_time']
  club.events << e and club.save! if club

  if type_list.split(',').include?(e[:name])
    Event.new( e ).save!
  end
  end
end


