Feature: Pickup location is empty when training initially added

Scenario: Pickup location is empty when training initially added

Given user added a new training for a student
When user opens detailed view of a training
* user is on the Overview tab
Then user see "Pickup location" section
* user sees placeholder message
* user sees + buton to add new pickup location
