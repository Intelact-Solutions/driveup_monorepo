Feature: Show confirmation popup when limit of enterprise seats reached

Scenario: Show confirmation popup when limit of enterprise seats reached

Given user is on the Enterprise princing plan
* user has used all slots defined in the initial Enterprise contract
When user click on "Add new team member"
Then user sees "Available seats limit reached" popup with a description
* user can agree and continue adding a new team member
* user can cancel the dialog
