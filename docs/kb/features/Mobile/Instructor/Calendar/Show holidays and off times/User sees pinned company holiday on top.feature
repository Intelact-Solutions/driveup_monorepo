Feature: User sees pinned company holiday on top

Scenario: User sees pinned company holiday on top

Given user is logged in
* the company has created a new company holiday
When user opens the calendar
* user navigates to one of the company holidays
Then user sees pinned calendar item on top of the calendar
* holiday items contains the name of the holiday
* holiday item is clickable and can be seen in detailed view as read-only 
* holiday item remains visible even when the user scrolls down
