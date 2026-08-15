Feature: Show holidays and off times in calendar

  Scenario: User sees non-working hours
  
  Given user is logged in
  * user has working and non-working hours
  When user opens the calendar
  Then non-working hours are displayed with a distinct grey background
  * student can't add an appointment to these slots in the student app
  * user can add appointment for these slots

  Scenario: User sees off-days pinned on top
  
  Given user is logged in
  * user is on the calendar of any team member
  * selected user has an off-day
  When user navigates to the off-day
  Then user sees pinned calendar item on top of the calendar
  * off-day item contains a name
  * off-day item is clickable and can be seen in detailed view as read-only 
  * off-day item remains visible even when the user scrolls down

  Scenario: User sees pinned company holiday on top
  
  Given user is logged in
  * the company has created a new company holiday
  When user opens the calendar
  * user navigates to one of the company holiday days
  Then user sees pinned calendar item on top of the calendar
  * holiday items contains the name of the holiday
  * holiday item is clickable and can be seen in detailed view as read-only 
  * holiday item remains visible even when the user scrolls down
