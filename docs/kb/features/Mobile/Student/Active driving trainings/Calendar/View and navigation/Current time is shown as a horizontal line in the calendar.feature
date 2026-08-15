Feature: Current time is shown as a horizontal line in the calendar

Scenario: Current time is shown as a horizontal line in the calendar

Given user is on "Calendar" view page 
* current time is shown as a horizontal line in the calendar (13:30)
When user stays in the calendar page for 30 more minutes
Then the horizontal line gets updated automatically 
* the horizontal line shows the current time of user (14:00)
