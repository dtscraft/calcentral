Feature: Filter events by category
    As a student
    So that I can find out about events that pique my interest
    I want to see search results by match my category


  Background: Events have been created
    Given there are upcoming events
    When I am logged into calcentral
    And I go to the dashboard

        
    Scenario: no categories are chosen all events should be visible
        When I press "search-events"
        Then I should see all events

    Scenario: search events belonging to one ore more categories
        When I fill in "category_field" with "Category_1,Category_2"
        And I press "search-events"
        Then I should see events for categories "Category_1,Category_2"
