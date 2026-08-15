Feature: Calendar is editable for managers

Scenario: Calendar is editable for managers

Given user is manager
* user is on the calendar default view
When user clicks on the top left menu
* and user selects another driving instructor
Then user sees only the calendar of the selected instructor
* user can view session details
* user can edit session details
* user can add new calendar item
