Feature: Filter events by category
    As a student
    So that I can find out about events that pique my interest
    I want to see search results by match my category


Background:
    Given the following events exist
    #http://www.ruby-doc.org/gems/docs/d/davidtrogers-cucumber-0.6.2/Cucumber/Ast/Table.html
    | events                     | category    | date         |
    | Cal Perfomance             | social      | 25-Oct-2013  |
    | Men's Soccer Game          | sport       | 23-Oct-2013  |
    | Cal Football Game          | sport       | 26-Oct-2013  |
    | Hackaton                   | engineering | 25-Oct-2013  |
    | Schedule planning Workshop | academic    | 21-Oct-2013  |
    | Facebook infosession       | infosession | 24-Oct-2013  |
    | HP infosession             | infosession | 23-Oct-2013  |
    | Enginnering series talk    | engineering | 24-Oct-2013  |
    | Free stress from midterms  | social      | 25-Oct-2013  |
    

Scenario: no categories are checked
    Then I should not see any events for this week
    | events                     | category    | date         |

Scenario: restrict to events with 'social' or 'engineering' category
    And I check the following category: social, engineering
    And I uncheck the following categories: sport, academic, infossesion
    And I press "categories_submit"
    Then I should see events with categories: social, engineering
    | events                     | category    | date         |
    | Cal Perfomance             | social      | 25-Oct-2013  |
    | Hackaton                   | engineering | 25-Oct-2013  |
    | Enginnering series talk    | engineering | 24-Oct-2013  |
    | Free stress from midterms  | social      | 25-Oct-2013  |


Scenario: all categories selected
    Then I should see all the events for this week
    | events                     | category    | date         |
    | Cal Perfomance             | social      | 25-Oct-2013  |
    | Men's Soccer Game          | sport       | 23-Oct-2013  |
    | Cal Football Game          | sport       | 26-Oct-2013  |
    | Hackaton                   | engineering | 25-Oct-2013  |
    | Schedule planning Workshop | academic    | 21-Oct-2013  |
    | Facebook infosession       | infosession | 24-Oct-2013  |
    | HP infosession             | infosession | 23-Oct-2013  |
    | Enginnering series talk    | engineering | 24-Oct-2013  |
    | Free stress from midterms  | social      | 25-Oct-2013  |