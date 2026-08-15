Feature: User can cancel new calendar item popup

Scenario: User can cancel new calendar item popup

Given user is on the calendar
* user has triggered the form to add new item
When user clicks "Cancel"
Then form is not saved
