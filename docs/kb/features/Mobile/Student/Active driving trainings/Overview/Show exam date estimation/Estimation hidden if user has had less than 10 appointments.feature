Feature: Estimation hidden if user has had less than 10 appointments

Scenario: Estimation hidden if user has had less than 10 appointments

Given user has a driving training
* user has had less than 10 appointments
When user opens training detailed view
Then user sees the empty state of the exam estimation
