Feature: User can see default pick-up location

Scenario: User can see default pick-up location

Given user has an active driving training
* user is on the detailed view of the training
When user scrolls to the bottom of the page
Then user sees the pickup location as a full address
