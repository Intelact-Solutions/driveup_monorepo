Feature: Default sorting is by date, with newest on top

Scenario: Default sorting is by date, with newest on top

Given user has a training
When user opens the training Finances tab
Then user sees student financial flow
* default sorting is based on date, with newest on top
* in the sort menu, "Newest first" is selected
