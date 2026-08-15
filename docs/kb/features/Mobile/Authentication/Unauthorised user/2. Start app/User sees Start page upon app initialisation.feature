Feature: User sees Start page upon app initialisation

Scenario: User sees Start page upon app initialisation

Given the user opens the DriveUp app for the first time
  * user has passed the loading screen
  When the app initializes
  Then the user should see the Start page with the text "Enter Your Phone number"
  * user sees page in device language, if device language is supported
