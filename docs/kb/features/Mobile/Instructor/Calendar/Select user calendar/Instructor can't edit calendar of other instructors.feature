Feature: Instructor can't edit calendar of other instructors

Scenario: Instructor can't edit calendar of other instructors

Given user is not a manager
* user is on the calendar default view
When user clicks on the top left menu
* and user selects another driving instructor
Then user sees only the calendar of the selected instructor
* user can view session details
* session are not editable
* user can't add a new calendar item
