Feature: Number of upcoming appointments and date of next appointment hidden if empty

Scenario: Number of upcoming appointments and date of next appointment hidden if empty

Given user has no upcoming appointments
When user opens detailed view of an active training
Then the fields for number of appointments and date of upcoming appointment are not visible
