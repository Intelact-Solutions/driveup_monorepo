Feature: User can add new training from global menu

Scenario: User can add new training from global menu

Given user is on any page in the application
When user clicks on the global "+ Add" button
* user selects "Add student"
* user enters all mandatory student data
* user submits the form
Then user sees a confirmation dialog with info text about the student being able to use the application from now on
* user can redirect to training details
* user can close the dialog
