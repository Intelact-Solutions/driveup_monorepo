Feature: Company logo is not mandatory

Scenario: Company logo is not mandatory

Given user is authenticated
* user has not completed onboarding
* user is on the company data page of the onboarding process
When user skips uploading the company logo
* user enters all other mandatory data
Then user can proceed to the next screen
