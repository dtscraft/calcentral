Feature: Sort events by event name and date

	 As a user of CalCentral
	 so that I can better find events
	 I want to be able sort the events by name, and date

	Background: events have been added to database


	Scenario: Sort events by name
     Given I have events 
     When I click the "Events"
     Then the events should be in alphabet order

    Scenario: Sort events by data
     Given I have events 
     When I click the "Data"
     Then the events should be in order by oldest to newest

   Scenario: No events to sort
     Given I have no events 
     When I click the "Events"
     Then there should be 0 events to sort

    