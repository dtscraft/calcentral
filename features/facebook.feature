Feature: Submit facebook urls for a club and sync with callink.berkeley.edu

   As a club administrator of a club on Calcentral
   So that I can get my facebook events published on Calcentral
   I want to be able to submit a url edit through the Calcentral system


   Scenario: pull Facebook events successfully to Calcentral and shown success message
     Given I am on the Calcentral homepage
     When I fill in "Facebook Club URL" with "https://www.facebook.com/groups/csuahosers/events/"
     And I press "submit"
     Then I should see "successfully pulled events!"
     And I should see "Hack+" on my schedule
     And I should see "H@B" on my schedule
   	

   Scenario: pull Facebook events failed and shown try again message
     Given I am on the Calcentral homepage
     When I fill in "Facebook Club URL" with "https://www.facebook.com/groups/csuahosers/eve/"
     And I press "submit"
     Then I should see "It is not a correct URL! Try again "
