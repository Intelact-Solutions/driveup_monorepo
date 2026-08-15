Feature: User can see in-charge instructor

Scenario: User can see in-charge instructor

Given user is logged in
When user clicks on an active training in the start page
Then user sees the name of the in-charge instructor
* user sees profile picture of the in-charge instructor
