Feature: User can rate company

Scenario: User can rate company

Given user is logged in
* user is on the detailed view of an active training
When user clicks on the three-dot menu icon
* user selects "Rate experience"
* user clicks on one of the ratings
* user clicks "Submit"
Then a new rating is added for the company
