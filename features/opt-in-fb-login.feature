Feature: Opt-in only Login with Facebook
 
  As a student
  So that I can access all events on facebook while logged into CalCentral
  I want to be able to additionally login into facebook through the CalCentral system.

Background: user logged into his/her facebook account

Scenario: import all events from facebook
  click on "Import Events"
  events from facebook added to CalCentral event calendar

Scenario: sync events by category
  check "Infosession" from categories
  submit
  only events regarding infosession appear on CalCentral 