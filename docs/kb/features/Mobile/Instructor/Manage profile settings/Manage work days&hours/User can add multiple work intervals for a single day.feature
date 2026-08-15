Feature: User can add multiple work intervals for a single day

Scenario: User can add multiple work intervals for a single day

Given user is an instructor
* user is on the "Working hours and days" page
* user has already added a work interval for a day
When user clicks on the + icon
* user enters "from" time and "to" time
Then a second work interval is saved for the user
