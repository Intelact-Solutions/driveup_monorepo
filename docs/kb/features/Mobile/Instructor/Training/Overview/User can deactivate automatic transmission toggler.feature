Feature: User can deactivate automatic transmission toggler

Scenario: User can deactivate automatic transmission toggler

Given user has added a training to student
* user has activated the "Automatic tranmission" toggler
* user is on the training Overview page
When user deactivates the "Automatic tranmission" toggler
Then driving appointments of the training are NOT shown on the calendar with the automatic tranmission symbol
