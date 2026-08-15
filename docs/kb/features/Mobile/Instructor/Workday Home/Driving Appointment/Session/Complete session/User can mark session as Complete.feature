Feature: User can mark session as Complete

Scenario: User can mark session as Complete

Given user is on a driving session
When user clicks "Complete lesson" button at the bottom of the page
Then the button is highlighted
* label on the button changes to "Lesson completed"
* on the Home view, the appointment is marked with a tick symbol
* on the Calendar, the appointment is marked with a tick symbol
