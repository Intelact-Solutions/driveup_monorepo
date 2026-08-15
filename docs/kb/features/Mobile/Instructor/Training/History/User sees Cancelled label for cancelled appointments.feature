Feature: User sees Cancelled label for cancelled appointments

Scenario: User sees Cancelled label for cancelled appointments

Given user has cancelled an appointment in the obligation period
When user goes to the History tab of the training
* user clicks on a session card with the label "Cancelled"
Then user sees the session details
* "Cancelled" label is shown on the detailed view of a session
