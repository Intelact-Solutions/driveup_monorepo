Feature: User can't select a slot with no empty places

Scenario: User can't select a slot with no empty places

Given user is on the list of available slots for a month
When user clicks on an appoinment with no empty places
Then no slot is selected
* user remains on the list of slots
