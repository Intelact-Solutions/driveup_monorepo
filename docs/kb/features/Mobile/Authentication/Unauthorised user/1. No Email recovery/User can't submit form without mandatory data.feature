Feature: User can't submit form without mandatory data

Scenario: User can't submit form without mandatory data

Given user is on the "Contact support" page
When has not added all the necessary data
Then user can't submit form
