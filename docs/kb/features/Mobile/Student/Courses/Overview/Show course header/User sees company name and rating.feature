Feature: User sees company name and rating

Scenario: User sees company name and rating

Given user is logged in
When user clicks on an active training in the start page
Then user sees company details in the training header
|company logo|company name|rating |
