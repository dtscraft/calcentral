Feature: When browsing events should if I filter events by club,
    they should appear within 3 seconds.
    As a student,
    So that I can find out more information about Club X, Y and/or Z
    I want to be able to filter upcoming events (within the next week) that belong to Club X, Y, or Z.


Background:
    Given there are upcoming events
    When I am logged into calcentral
    When I go to the dashboard

Scenario: no clubs are in the input field
    When I press "search-events"
    Then I should see all events

Scenario: restrict to events belonging to "Club_1"
    When I fill in "club" with "Club_1"
    When I press "search-events"
    Then I should see events for "Club_1"

