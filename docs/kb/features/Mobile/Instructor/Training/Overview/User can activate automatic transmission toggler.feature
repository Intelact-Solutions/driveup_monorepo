Feature: User can activate automatic transmission toggler

Scenario: User can activate automatic transmission toggler

Given user has added a training to student
* user has not activated the "Automatic tranmission" toggler
* user is on the training Overview page
When user activates the "Automatic tranmission" toggler
Then driving appointments of the training are shown on the calendar with the automatic tranmission symbol
