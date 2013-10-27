Feature: Submit facebook urls for a club and sync with callink.berkeley.edu
 
  As a club organizer / president 
  So that I can reach out to other people in school
  I want to be able to promote my clubs' events on the website through submitting facebook urls and sync with callink.berkeley.edu

Background: movies have been added to database

  Given the following movies exist:
  

  And  I am on the Calcentral web page

Scenario: Submitting facebook urls for a club and sync with callink.berkeley.edu
  # enter step(s) to check the 'PG' and 'R' checkboxes
  When I past my facebook link
  # enter step(s) to uncheck all other checkboxes
  And I fill in the caption
  # enter step to "submit" the search form on the homepage
  And I press "Submit"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see my event be on the Calcentral events and sync with callink.berkeley.edu.


