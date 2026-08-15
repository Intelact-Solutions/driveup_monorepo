Feature: User sees course location

Scenario: User sees course location

Given user is a student
When user opens the detailed view of a course
* user scrolls to the bottom of the screen
Then user sees course location
* clicking the course location card opens the location on Google Maps
