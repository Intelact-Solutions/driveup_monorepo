Feature: Start time of driving session triggers new cost generation

Scenario: Start time of driving session triggers new cost generation

Given student has a training
* student has an appointment
* student has balance -100 CHF
* appointment price is 50 CHF
When the start time of the appointment enters
Then the balance of the student changes to -150 CHF
