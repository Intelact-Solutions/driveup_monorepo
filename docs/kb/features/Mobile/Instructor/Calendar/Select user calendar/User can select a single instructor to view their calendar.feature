Feature: User can select a single instructor to view their calendar

Scenario: User can select a single instructor to view their calendar

Given user is instructor
* user is not manager
* user is on the calendar default view
When user clicks on the top left menu
* and user selects another driving instructor
Then user sees only the calendar of the selected instructor
* user can't select more than one instructor
* the calendar shows picture and name of selected instructor as a tag
* calendar is read-only
