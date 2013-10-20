Feature: Filter events by category
    As a student
    So that I can find out about events that pique my interest
    I want to see search results by match my category


Background:
    Given the following events exist
    #http://www.ruby-doc.org/gems/docs/d/davidtrogers-cucumber-0.6.2/Cucumber/Ast/Table.html
    | title                   | rating | release_date |
    | Aladdin                 | G      | 25-Nov-1992  |
    | The Terminator          | R      | 26-Oct-1984  |
    | When Harry Met Sally    | R      | 21-Jul-1989  |
    | The Help                | PG-13  | 10-Aug-2011  |
    | Chocolat                | PG-13  | 5-Jan-2001   |
    | Amelie                  | R      | 25-Apr-2001  |
    | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
    | The Incredibles         | PG     | 5-Nov-2004   |
    | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
    | Chicken Run             | G      | 21-Jun-2000  |

Scenario: no categories are checked
    Then I should see all the events for this week

Scenario: restrict to events with 'social' or 'engineering' category
    And I check the following ratings: PG, R
    And I uncheck the following ratings: G, PG-13, NC-17
    And I press "categories_submit"

Scenario: all categories selected
    Then I should see all the events for this week
