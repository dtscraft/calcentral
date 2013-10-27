Feature: Filter events by category
    As a student
    So that I can find out about events that pique my interest
    I want to see search results by match my category


Background:
    Given the following events exist
    #http://www.ruby-doc.org/gems/docs/d/davidtrogers-cucumber-0.6.2/Cucumber/Ast/Table.html
    | events                     | type        | start_time         |  end_time        | club     |
    | Cal Perfomance             | social      | 25-Oct-2013 05:00:00 -0700   | 25-Oct-2013 08:00:00 -0700  | school   |
    | Men's Soccer Game          | sport       | 23-Oct-2013 06:00:00 -0700| 23-Oct-2013  09:00:00 -0700| soccer   |
    | Cal Football Game          | sport       | 26-Oct-2013 06:00:00 -0700 | 26-Oct-2013 09:00:00 -0700  | football |
    | Hackaton                   | engineering | 25-Oct-2013 7:00:00 -0700 | 25-Oct-2013 10:00:00 -0700 | HKN      |
    | Schedule planning Workshop | academic    | 21-Oct-2013  | 21-Oct-2013  | school   |
    | Facebook infosession       | infosession | 24-Oct-2013  | 24-Oct-2013  | CS       |
    | HP infosession             | infosession | 23-Oct-2013  | 23-Oct-2013  | CS       |
    | Enginnering series talk    | engineering | 24-Oct-2013  | 24-Oct-2013  | EECS     |
    | Free stress from midterms  | social      | 25-Oct-2013  | 25-Oct-2013  | ME       |
    

Scenario: no categories are checked
    Then I should not see events with type: 'social', 'sport', 'engineering', 'academic', 'infosession'
    | events                     | type        | date         | time         | club |

Scenario: restrict to events with 'social' or 'engineering' category
    When I check the following events: social, engineering
    And I press Refresh
    Then I should see events with type: social, engineering
    | events                     | category    | start_time         |  end_time      | club   |
    | Cal Perfomance             | social      | 25-Oct-2013  |25-Oct-2013 | school |
    | Hackaton                   | engineering | 25-Oct-2013  |25-Oct-2013 | HKN    |
    | Enginnering series talk    | engineering | 24-Oct-2013  |25-Oct-2013 | EECS   |
    | Free stress from midterms  | social      | 25-Oct-2013  |25-Oct-2013 | ME     |


Scenario: all categories selected
    Then I should see events with type: social, sport, engineering, academic, infosession
    | events                     | type        | start_time         |  end_time        | club     |
    | Cal Perfomance             | social      | 25-Oct-2013        | 25-Oct-2013      | school   |
    | Men's Soccer Game          | sport       | 23-Oct-2013        | 23-Oct-2013      | soccer   |
    | Cal Football Game          | sport       | 26-Oct-2013        | 26-Oct-2013      | football |
    | Hackaton                   | engineering | 25-Oct-2013        | 25-Oct-2013      | HKN      |
    | Schedule planning Workshop | academic    | 21-Oct-2013        | 21-Oct-2013      | school   |
    | Facebook infosession       | infosession | 24-Oct-2013        | 24-Oct-2013      | CS       |
    | HP infosession             | infosession | 23-Oct-2013        | 23-Oct-2013      | CS       |
    | Enginnering series talk    | engineering | 24-Oct-2013        | 24-Oct-2013      | EECS     |
    | Free stress from midterms  | social      | 25-Oct-2013        | 25-Oct-2013      | ME       |