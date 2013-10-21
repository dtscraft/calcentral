Feature: When browsing events should if I filter events by club,
    they should appear within 3 seconds.
    As a student,
    So that I can find out more information about Club X, Y and/or Z
    I want to be able to filter upcoming events (within the next week) that belong to Club X, Y, or Z.


Background:
    Given the following events exist
    #http://www.ruby-doc.org/gems/docs/d/davidtrogers-cucumber-0.6.2/Cucumber/Ast/Table.html
    | event | start_time | end_time |
    | Aladdin Party           | 25-Nov-2014 | 25-Nov-2014  |
    | The Terminator  Party   | 26-Oct-2012 | 26-Oct-2012  |
    | When Harry Met Sally  Party | 21-Jul-2013 | 21-Jul-2013  |
    | The Help Pary           | 10-Aug-2011 | 10-Aug-2011  |
    | Chocolat Party               | 5-Jan-2013  | 5-Jan-2013   |
    | Amelie  Party | 25-Apr-2013 | 25-Apr-2013  |
    | 2013: A Space Odyssey  Party  | 6-Apr-2014 | 6-Apr-2014   |
    | The Incredibles    Party| 5-Nov-2012 | 5-Nov-2012   |
    | Raiders of the Lost Ark Party | 12-Jun-2012 | 12-Jun-2012  |
    | Chicken Run Party            | 21-Jun-2015 | 21-Jun-2015  |

Scenario: no clubs are added
    Then I should see all the events for this week

Scenario: restrict to events belonging to 'HKN' or 'IEEE' organizations
    And I type in "IEEE"
    And I press "add_club"
    And I type in "HKN"
    And I press "add_club"
    Then I should see all the events within the next week for the clubs "HKN, IEEE"

Scenario: all clubs checkbox checked
    Then I should see all the events for this week
