Feature: User can remove Complete flag

Scenario: User can remove Complete flag

Given user is on the driving session
* user has previously marked the session as complete
When user clicks the "Lesson completed" button
Then the label changes to "Complete lesson"
* highlight is removed
* on the calendar, the green tick is removed for the appointment
* on the home view, the green tick is removed for the appointment
