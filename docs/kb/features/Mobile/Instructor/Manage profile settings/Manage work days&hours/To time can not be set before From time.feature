Feature: To time can not be set before From time

Scenario: To time can not be set before From time

Given user is an instructor
* user is on the "Working hours and days" page
* user has already added a work interval for a day
When user clicks on the + icon
* user enters "from" time 8
* user enters "to" time 7
* user submits 
Then the "Submit" button is disabled 
* user can not set "to" time previous to "from" time
