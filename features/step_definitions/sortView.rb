
Given(/^that there are events$/) do
			find("span", text: "Event Name").click
   # suppose to get fake events here.  It can be passed in from feature file or stubbing fake events


end
Given(/^that there are no events$/) do
   find("span", text: "Event Name").click
   # I think this can the above method can be combined together

end

Then(/^the events should be in alphabet order$/) do
	find("span", text: "Event Name").click
	# Once we have fake events we can go to database and take events out base on condition 
     
end

Then(/^the events should be in order by oldest to newest$/) do
	find("span", text: "Date Time").click

end

Then(/^there should be 0 events to sort$/) do
   # database should be empty
end



When /^(?:|I )click the "([^"]*)"$/ do |text|
  click_button(text)
end
