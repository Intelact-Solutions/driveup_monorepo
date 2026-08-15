Feature: Clicking on the course progress card leads user to the Parts tab

Scenario: Clicking on the course progress card leads user to the Parts tab

Given user is a student
* user is on the "Overview" tab of a course
When user clicks on the course progress card
Then user is redirected to the "Parts" tab
