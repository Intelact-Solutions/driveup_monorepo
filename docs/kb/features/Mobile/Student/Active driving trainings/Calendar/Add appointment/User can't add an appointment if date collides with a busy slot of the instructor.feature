Feature: User can't add an appointment if date collides with a busy slot of the instructor

Scenario: User can't add an appointment if date collides with a busy slot of the instructor

Given in-charge instructor has a busy slot in a specific date
* user has an active driving training 
* user is on "Calendar" page
* user opens the "Add" form
When user clicks on the date field
* and user selects a date which collides with a busy slot of the instructor
Then an error message is displayed 
* user can not add the appointment
