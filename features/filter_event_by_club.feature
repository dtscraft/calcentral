Feature: When browsing events should if I filter events by club,
    they should appear within 3 seconds.
    As a student,
    So that I can find out more information about Club X, Y and/or Z
    I want to be able to filter upcoming events (within the next week) that belong to Club X, Y, or Z.


Background:
    Given the following events exist
    #http://www.ruby-doc.org/gems/docs/d/davidtrogers-cucumber-0.6.2/Cucumber/Ast/Table.html
    | events                     | type        | start_time                 |  end_time                    | club     |
    | Cal Perfomance             | social      | 25-Oct-2013 05:00:00 -0700 | 25-Oct-2013  08:00:00 -0700  | school   |
    | Men's Soccer Game          | sport       | 23-Oct-2013 06:00:00 -0700 | 23-Oct-2013  09:00:00 -0700  | soccer   |
    | Cal Football Game          | sport       | 26-Oct-2013 06:00:00 -0700 | 26-Oct-2013  09:00:00 -0700  | football |
    | Hackaton                   | engineering | 25-Oct-2013 7:00:00 -0700  | 25-Oct-2013  06:00:00 -0700  | HKN      |
    | Schedule planning Workshop | academic    | 20-Oct-2013 12:00:00 -0700 | 21-Oct-2013  07:00:00 -0700  | school   |
    | Facebook infosession       | infosession | 23-Oct-2013 13:00:00 -0700 | 24-Oct-2013  08:00:00 -0700  | CS       |
    | HP infosession             | infosession | 22-Oct-2013 14:00:00 -0700 | 23-Oct-2013  09:00:00 -0700  | CS       |
    | Enginnering series talk    | engineering | 23-Oct-2013 15:00:00 -0700 | 24-Oct-2013  10:00:00 -0700  | EECS     |
    | Free stress from midterms  | social      | 24-Oct-2013 16:00:00 -0700 | 25-Oct-2013  11:00:00 -0700  | ME       |

Scenario: no clubs are added
    Then I should not see events with type: school, soccer, football, CS, EECS, ME

Scenario: restrict to events belonging to 'HKN' or 'CS' organizations
    When I check the following events: HKN, CS 
    And I press Refresh
    Then I should see events with type: HKN, CS
    | events                     | type        | date         |  time        | club     |
    | Hackaton                   | engineering | 25-Oct-2013  | 25-Oct-2013  | HKN      |
    | Facebook infosession       | infosession | 24-Oct-2013  | 24-Oct-2013  | CS       |
    | HP infosession             | infosession | 23-Oct-2013  | 23-Oct-2013  | CS       |

    When I check the following events: HKN
    And I press Refresh
    Then I should see events with type: HKN, CS
    | events                     | type        | date         |  time        | club     |
    | Hackaton                   | engineering | 25-Oct-2013  | 25-Oct-2013  | HKN      |
    
    

Scenario: all clubs checkbox checked
    Then I should see events with type: school, soccer, football, CS, EECS, ME
    | events                     | type        | date         |  time        | club     |
    | Cal Perfomance             | social      | 25-Oct-2013  | 25-Oct-2013  | school   |
    | Men's Soccer Game          | sport       | 23-Oct-2013  | 23-Oct-2013  | soccer   |
    | Cal Football Game          | sport       | 26-Oct-2013  | 26-Oct-2013  | football |
    | Hackaton                   | engineering | 25-Oct-2013  | 25-Oct-2013  | HKN      |
    | Schedule planning Workshop | academic    | 21-Oct-2013  | 21-Oct-2013  | school   |
    | Facebook infosession       | infosession | 24-Oct-2013  | 24-Oct-2013  | CS       |
    | HP infosession             | infosession | 23-Oct-2013  | 23-Oct-2013  | CS       |
    | Enginnering series talk    | engineering | 24-Oct-2013  | 24-Oct-2013  | EECS     |
    | Free stress from midterms  | social      | 25-Oct-2013  | 25-Oct-2013  | ME       |