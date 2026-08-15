Feature: User sees list of course parts

Scenario: User sees list of course parts

Given user is a student
* user is on the detailed view of a course
When user navigates to the "Parts" tab of a course
Then user sees list of course parts
* for each course part, user sees following data
|part name| date | time |
* for course parts in which the user participated, user sees "Present" label
* for course parts for which no upcoming slot is booked, user sees "Slot not selected" label
* for course parts in which the user booked but did not participate, user sees highlighted item with the date and time of the missed slot
* course parts are sorted chronologically
