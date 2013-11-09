Given /I have user access token/  do
	  body = 'you'
      FakeWeb.register_uri(:get, "http://google.com/", :body => body)
      response = Net::HTTP.get(URI.parse("http://google.com/"))
      assert response == body
end


Given /I want facebook events for club 1/  do
	
end

When /I run a background/  do
	
end

Then /I should get all facebook events for club 1/  do
	
end
