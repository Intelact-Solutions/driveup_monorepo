Feature: User can add company logo by taking a picture with phone camera

Scenario: User can add company logo by taking a picture with phone camera

Given user is authenticated
* user has not completed onboarding
* user is on the first page of the onboarding process 
When user selects the option to add a profile picture
  * user chooses to take a picture with the phone camera
  Then camera interface opens
  * user can take a picture with their device
  * picture is displayed as the profile picture
  * profile picture is saved successfully
