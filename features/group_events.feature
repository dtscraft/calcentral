Feature: Retrieve events from Facebook Groups.

         As a person signing into Facebook in calcentral
         So I get event id(s) from Facebook Groups id(s)
         I want to be able store each event id(s) in calcentral database

Background:
   Given I have user access token

Scenario: Get events for Club_1
    Given I want facebook events for club 1 #nothing
    When I run a background #nothing
    Then I should get all facebook events for club 1 #run a test