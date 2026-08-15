Feature: User can skip admin fee for a training

Scenario: User can skip admin fee for a training

Given student has a training
* user is on the training overview page
When user activates the "No admin fee" toggler
Then admin fee amount is reduced from the list of student costs
