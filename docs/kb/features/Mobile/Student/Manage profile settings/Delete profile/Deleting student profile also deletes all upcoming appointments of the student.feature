Feature: Deleting student profile also deletes all upcoming appointments of the student

Scenario: Deleting student profile also deletes all upcoming appointments of the student

Given user is a student
* user has upcoming appointments in the driving school
When user opens settings page for the student profile
* user clicks on "Delete Profile"
Then user sees a confirmation dialog
* user sees an info message that all appointments will be deleted
* upon confirming, all student appointments are deleted
