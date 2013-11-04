Feature: Retrieve events from Callink API.

	 As a student
	 So I can see detail events on campus
	 I want to be able to view events from CalCentral

Background: events have been added to database

   Given the folloing events exist:
   |   Monday   |   Tuesday   |   Wednesday   |   Thursday   |   Friday    |   Saturday    |   Sunday    |
 	 | career fair|Google info  |Cal vs.Stanford|Social Justice|4Corner Chris|Cal Orchestra  |EECS starup  |
	 | at RSF at  |session at   |at Cal stadium |speech by Le  |tian fellowsh|at Greek       |fair at Soda |
	 | 12pm	      |Woz at 6pm   |at 11am        |at wheeler 4pm|p meeting at |Theater at 10am|at 2pm       |
   |Haas Gala   |EECS Alumni  |Chinese New    |International |Snoop Dogg   |Art exhibition |Martial Art  |
   |at Haas     |conference   |Year Banquet   |Students      |concert at   |at Stanley Hall|show at      |
	 |school at   |at Alumni    |at I-House     |network at I- |Greek theater|at 11am        |Sproul at    |
	 |1:30 pm     |house at 10am|at 8pm         |house 5 pm    |at 10pm      |   		         |3pm          |

  
   And I am on the CalCentral home page

Scenario: display views of events in a list
	 
    When I click the "ListView" 
    Then I should see "Monday"
    And I should see "career fair"
    And I should see "Haas Gala"
    And I should see "Tuesday"
    And I should see "Google info"
    And I should see "EECS Alumni"