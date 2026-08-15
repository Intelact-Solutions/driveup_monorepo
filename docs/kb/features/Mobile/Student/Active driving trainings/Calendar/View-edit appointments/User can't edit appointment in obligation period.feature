Feature: User can't edit appointment in obligation period

Scenario: User can't edit appointment in obligation period

Given user has an active driving training 
* user has an upcoming appointment
* appointment is in the obligation period
When user opens the appointment
Then appointment is read-only
* user can't edit any of the fields
