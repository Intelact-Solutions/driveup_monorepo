Feature: Notes are shown with newest on top

Scenario: Notes are shown with newest on top

Given user has a training
* user has multiple notes
* user is on the driving session
When user opens list of notes
Then notes are shown with the newest on top
