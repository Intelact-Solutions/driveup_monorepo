Feature: Working day intervals can overlap

Scenario: Working day intervals can overlap

Given user is an instructor
* user is on the "Working hours and days" page
* user has already added a work interval for a day (9-14)
When user clicks on the + icon
* user enters "from" time and "to" time (8-13)
Then the new interval displayed is 8-14 
* no other interval is not shown anymore
