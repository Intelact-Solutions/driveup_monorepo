Feature: Trigger new calendar item by clicking on slot

Scenario: Trigger new calendar item by clicking on slot

Given user is on the calendar
When user clicks on an empty slot
Then user sees the form to add a new calendar item
* "Session" is selected as default type
* selected instructor is automatically added as instructor
* instructor is not editable
* time and date are pre-defined but editable
