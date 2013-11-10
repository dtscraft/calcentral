Given /I want facebook events for facebook page "([^"]*)"/ do |club_id| end

When /I get facebook events for facebook page "(.*)"/ do |url| 
      facebook_page_id = Event.facebookIDFromFacebookPageUrl(url)
      url = "https://graph.facebook.com/#{facebook_page_id}?access_token=#{@@access_token}"
      facebook_page =  File.open( File.join(File.expand_path(File.dirname(__FILE__)), "..", "support", "facebook_page_fake.json"), "r").read
      facebook_page_events = Fakeweb.register_uri(:get, url, :body => facebook_page)
      url1 = "http://graph.facebook.com/#{facebook_page_events.data['id'][2]}?access_token=#{@@access_token}"
      event_page = File.open( File.join(File.expand_path(File.dirname(__FILE__)), "..", "support", "event_page_fake.json"), "r").read
      Fakeweb.register_uri(:get, url1, :body => event_page)
      #facebook_page_events.data.each do |event|
       # new_event = Event.create!(:name => event.name, :start_time => event.start_time, :end_time => event.end_time, :description => event.description)
      
  
#Then /there should be (.*) events for Facebook page (.*)/ do |n, facebook_id|
 #   assert facebook_page_events.events.count == n.to_i, "got #{Club.find_by_facebook_id!(facebook_id).events.count} events instead of #{n} events for club with facebook id #{facebook_id}"
#end
