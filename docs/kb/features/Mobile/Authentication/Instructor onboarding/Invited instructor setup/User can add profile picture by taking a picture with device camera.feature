Feature: User can add profile picture by taking a picture with device camera

Scenario: User can add profile picture by taking a picture with device camera

Given user is authenticated
* user is on the first page of the onboarding process 
When user selects the option to add a profile picture
  * user chooses to take a picture with the device camera
  Then camera interface opens
  * user can take a picture with their device
  * picture is displayed as the profile picture
  * profile picture is saved successfully
