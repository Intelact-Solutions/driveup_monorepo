Feature: User sees non-working hours

Scenario: User sees non-working hours

Given user is logged in
* user has created working and non-working hours
When user opens the calendar
Then non-working hours are displayed with a distinct grey background
* students can't add an appointment to these slots
