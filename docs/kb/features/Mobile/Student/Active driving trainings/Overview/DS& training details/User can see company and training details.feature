Feature: User can see company and training details

Scenario: User can see company and training details

Given user is logged in
When user clicks on an active training in the start page
Then user sees company details
|company logo|company name|rating|category badge|
