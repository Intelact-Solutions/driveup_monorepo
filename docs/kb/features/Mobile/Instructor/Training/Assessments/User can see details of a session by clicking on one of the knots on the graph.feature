Feature: User can see details of a session by clicking on one of the knots on the graph

Scenario: User can see details of a session by clicking on one of the knots on the graph

Given user has a training with a student
* student had more than 1 appointment
* user is on the "Assessment" tab of the training
When user clicks on a dot in the graph
Then user sees a session info tooltip
* tolltip contains the score of the session
