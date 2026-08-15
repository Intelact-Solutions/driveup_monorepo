Feature: Instructor can see list of archived trainings

Scenario: Instructor can see list of archived trainings

Given instructor has multiple archived trainings
* instructor is on the Home screen
When instructor clicks "Trainings" on the app menu
* instructor switches to the "Archived" tab
Then instructor lands on the list of archived trainings
* each training card contains the following elements
|student name|student picture|student balance|category badge| status | "Archived" label |
