Feature: Pick-up location is updated if changed by instructor or company

Scenario: Pick-up location is updated if changed by instructor or company

Given user has an active driving training
* user has had a standard pick-up location
When instructor or company change the pick-up location
Then the new pick-up location is visible for the student
