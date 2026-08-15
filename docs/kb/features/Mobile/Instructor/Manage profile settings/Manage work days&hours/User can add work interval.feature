Feature: User can add work interval

Scenario: User can add work interval

Given user is an instructor
* user is on the "Working hours and days" page
When user activates the toggler for a day of the week
* user clicks on the + icon
* user enters "from" time and "to" time
Then new work interval is saved for the user
