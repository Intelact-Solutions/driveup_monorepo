Feature: Show default calendar view

  Scenario: On initial load, default view shows calendar of active user
  
  Given user is logged in
  When user goes to the calendar section in the app
  Then user sees current day of his own calendar
  * default view is always the day view of the current day

  Scenario: User can combine filters of the calendar
  
  Given user has opened the calendar
  * user has different types of appointments
  When user expands the right vertical menu
  * user selects multiple filters
  Then appointments are filteed based on the selected filter combination

  Scenario: User can filter based on appointment type
  
  Given user has opened the calendar
  * user has different types of appointments
  |drving trainings|fixed courses|flexible courses|cancelled appointments|instructor tasks|
  When user expands the right vertical menu
  * user clicks on appointment type filter <type>
  Then appointments are filteed based on the selected appointment type
  
  Examples:
  |type|
  |driving training|
  |fixed courses|
  |flexible courses|
  |cancelled appointments|
  |instructor tasks|

  Scenario: User sees last state of the calendar if calendar was opened before
  
  Given user is logged in
  * user has viewed calendar for instructor Max Mustermann
  * user has filtered for driving trainings
  * user has moved to another page in the application
  When user opens the calendar again
  * user sees the last state of the calendar
  * user sees calendar for instructor Max Mustermann
  * calendar is filtered for driving trainings
