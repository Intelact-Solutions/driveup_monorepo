Feature: User can call student

Scenario: User can call student

Given user is an instructor
* user is on the Overview page of a training
When user clicks the call icon
Then user is redirected to the phone functionality of the device
* student phone number is auto-filled
* user can trigger a call
