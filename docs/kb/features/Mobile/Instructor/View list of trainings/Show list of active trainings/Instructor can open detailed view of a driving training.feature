Feature: Instructor can open detailed view of a driving training

Scenario: Instructor can open detailed view of a driving training

Given instructor has multiple trainings
* instructor is on the list of archived trainings
When instructor clicks on one of the trainings
Then instructor lands on the detailed view of the training
* instructor lands per default on the "Overview" tab
