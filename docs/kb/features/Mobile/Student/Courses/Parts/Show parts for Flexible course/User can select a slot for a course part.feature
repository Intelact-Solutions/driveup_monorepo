Feature: User can select a slot for a course part

Scenario: User can select a slot for a course part

Given user is a student
* user is on the detailed view of the course
* user has not yet been present in a course part
When user navigates to the "Parts" tab of a course
* user clicks the calendar icon of the course part
* user selects an available slot
Then the time slot is selected
* the selected date and time is shown below the part name
