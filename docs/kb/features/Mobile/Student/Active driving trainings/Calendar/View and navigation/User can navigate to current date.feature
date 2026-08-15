Feature: User can navigate to current date

Scenario: User can navigate to current date

Given user is on "Calendar" view page 
* user is on a day other than the current day 
When user clicks the "Go to current date" icon on the top left side of the page 
Then user is taken to the current day
* the button always shows the current date
