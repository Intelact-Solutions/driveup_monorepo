Feature: User can see details of a session by clicking on one of the knots on the graph

Scenario: User can see details of a session by clicking on one of the knots on the graph

Given student has a training
* student has had more than 1 appointment
* student is on the "Assessment" tab of the training
When student clicks on a dot in the graph
Then student sees a session info tooltip
* tolltip contains the score of the session
