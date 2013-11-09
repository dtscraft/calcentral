Feature: Filter events by category
    As a student
    So that I can find out about events that pique my interest
    I want to see search results by match my category


Background:
    Given there are upcoming events
    When I am logged into calcentral
    When I go to the dashboard

Scenario: no categories are chosen all events should be visible
    When I press "Search"
    Then I should see all events

Scenario: restrict to events with 'social' or 'engineering' category
    When I fill in "category" with "Category_1"
    Then I should see events for categories "Category_1"