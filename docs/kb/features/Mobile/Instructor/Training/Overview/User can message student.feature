Feature: User can message student

Scenario: User can message student

Given user is an instructor
* user is on the Overview page of a training
When user clicks the message icon
Then user is redirected to the SMS functionality of the device
* student phone number is auto-filled
* user can compile an SMS
* user can send an SMS
