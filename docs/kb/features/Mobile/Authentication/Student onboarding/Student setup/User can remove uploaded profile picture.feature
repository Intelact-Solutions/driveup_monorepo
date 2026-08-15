Feature: User can remove uploaded profile picture

Scenario: User can remove uploaded profile picture

Given user is authenticated
* user is on the first page of the onboarding process 
* user has entered all mandatory data
When user removes the image
Then the avatar displays no image
* user can proceed to the next screen
