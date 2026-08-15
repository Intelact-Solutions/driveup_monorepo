Feature: User can add new appointment by clicking + button

Scenario: User can add new appointment by clicking + button

Given user has an active driving training 
* user is on "Calendar" page
When user clicks the "+" button 
* user selects time and date
* user clicks "Save"
Then new appointment is saved and visible on the calendar
* in-charge instructor is automatically added
* default training location is added as pickup location
