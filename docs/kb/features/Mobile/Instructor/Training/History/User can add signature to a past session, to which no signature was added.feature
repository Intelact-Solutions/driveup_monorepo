Feature: User can add signature to a past session, to which no signature was added

Scenario: User can add signature to a past session, to which no signature was added

Given user has a past driving session
* user has not added a signature
When user goes to list of trainings
* user opens history of the training
* user goes to the corresponding session
Then user sees "Add signature" button
* user can add signature
* "Add signature" button is hidden after signature is added
