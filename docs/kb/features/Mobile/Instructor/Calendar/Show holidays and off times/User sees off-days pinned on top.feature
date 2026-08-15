Feature: User sees off-days pinned on top

Scenario: User sees off-days pinned on top

Given user is logged in
* user is on the calendar of any team member
* selected user has an off-day
When user navigates to the off-day
Then user sees pinned calendar item on top of the calendar
* off-day item contains the name of the holiday
* off-day item is clickable and can be seen in detailed view as read-only 
* off-day item remains visible even when the user scrolls down
