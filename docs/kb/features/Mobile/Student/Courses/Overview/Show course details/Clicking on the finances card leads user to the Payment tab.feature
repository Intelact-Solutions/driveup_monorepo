Feature: Clicking on the finances card leads user to the Payment tab

Scenario: Clicking on the finances card leads user to the Payment tab

Given user is a student
* user is on the "Overview" tab of a course
When user clicks on the finances card
Then user is redirected to the "Payment" tab
