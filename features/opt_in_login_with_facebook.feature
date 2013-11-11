Feature: Opt-in only Login with Facebook
    As a student,
    So that I can access all events on facebook while logged into CalCentral
    I want to be able to additionally login into facebook through the CalCentral system.


Background: I am logged into calcentral

Scenario: user finds facebook login link on event page
    When I am on "events" 
    Then I should see "Connect to Facebook"

Scenario: user login into facebook with his facebook ID and password
    When I press "Connect to Facebook"
    And I fill in "User ID"
    And I fill in "Password"
    And I press "Login"
    Then I should see events imported from facebook
