Feature: Profile picture is not mandatory

Scenario: Profile picture is not mandatory

Given user is authenticated
* user is on the first page of the onboarding process
When user skips uploading the profile picture
* user enters all other mandatory data
Then user can proceed to the next screen
