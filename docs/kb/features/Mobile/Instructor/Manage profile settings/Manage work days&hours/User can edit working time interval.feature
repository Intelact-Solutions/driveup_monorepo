Feature: User can edit working time interval

Scenario: User can edit working time interval

Given user is an instructor
* user is on the "Working hours and days" page
* user has already added a work interval for a day
When user clicks the edit icon for the interval 
Then "Set time" screen is triggered 
* user can edit from and to time 
* the changes are saved successfully
