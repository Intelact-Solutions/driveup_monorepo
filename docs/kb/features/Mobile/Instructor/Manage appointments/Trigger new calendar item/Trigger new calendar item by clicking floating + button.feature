Feature: Trigger new calendar item by clicking floating + button

Scenario: Trigger new calendar item by clicking floating + button

Given user is on the calendar
When user clicks on the floating + button
Then user sees the form to add a new calendar item
* "Session" is selected as default type
* selected instructor is automatically added as instructor
* instructor is not editable
* time and date is empty
