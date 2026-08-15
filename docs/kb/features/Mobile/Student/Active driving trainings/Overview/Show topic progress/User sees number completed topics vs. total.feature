Feature: User sees number completed topics vs. total

Scenario: User sees number completed topics vs. total

Given user is logged in
* user has an active driving training
When user opens detailed view of a training
Then user sees number of topics completed compared to total number of topics
