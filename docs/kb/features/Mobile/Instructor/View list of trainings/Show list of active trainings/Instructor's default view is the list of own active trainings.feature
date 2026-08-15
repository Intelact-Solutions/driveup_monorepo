Feature: Instructor's default view is the list of own active trainings

Scenario: Instructor's default view is the list of own active trainings

Given instructor has multiple trainings
* instructor is on the Home screen
When instructor clicks "Trainings" on the app menu
Then instructor lands on the default list of active trainings for which he is in charge
* each training card contains the following elements
|student name|student picture|student balance|category badge|
