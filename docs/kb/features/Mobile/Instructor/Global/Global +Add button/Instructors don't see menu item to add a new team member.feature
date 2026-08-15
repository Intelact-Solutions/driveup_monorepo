Feature: Instructors don't see menu item to add a new team member

Scenario: Instructors don't see menu item to add a new team member

Given user is instructor
* user is logged in
When user clicks on the global Add button
Then user sees no item to add a new team member
