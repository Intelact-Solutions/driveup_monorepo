Feature: User can unselect appointment

Scenario: User can unselect appointment

Given user is a student
* user is on the detailed view of the course
* user has not yet been present in a course part
When user navigates to the "Parts" tab of a course
* user clicks the calendar icon of the course part
* user selects an available slot
Then the time slot is selected
* user can unselect the appointment 
* the selected date and time is removed below the part name
* 1 availabe seat is added to the appointment
