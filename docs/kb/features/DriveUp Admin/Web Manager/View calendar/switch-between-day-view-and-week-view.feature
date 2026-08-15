Feature: Switch between day view and week view

  Scenario: List of daily calendar items on month view can be expanded when too long
  
  Given user is on the calendar page
  * user has 10 calendar items for a given date
  When user switches to month view
  * user navigates to the given date
  Then user sees list of calendar items for the date
  * only 5 items are shown
  * user sees "+5 more" label at the bottom
  * clicking the "+5 more" label shows the list of calendar items for the day in a popup
  * calendar items in the popup are clickable

  Scenario: User can return to current day with one click
  
  Given user is on the calendar
  * user has navigated to a different day or week than the current one
  When user clicks the today icon
  Then user is redirected to the current day

  Scenario: User can see calendar in month view
  
  Given user is logged in
  When user goes to the calendar page
  * user expands the right vertical menu
  * user selects "month view"
  Then user sees calendar in month view
  * calendar items in a day are shown as a chronological list
  * user can switch between months with chevrons
  * current day is highlighted
  * user sees only student picture, student name and start time for driving appointments
  * user sees only course name and start time for courses

  Scenario: User can see calendar in week view
  
  Given user is logged in
  When user goes to the calendar page
  Then user sees calendar in week view
  * user can switch between weeks with chevrons
  * user sees details of driving appointments
  |student picture|student name|start and end time| driving category |
  * user sees details of course appointments
  |course name|part title|number of participants|
  * current day highlighted on the header
  * timeline is shown

  Scenario: User can select any given date
  
  Given user is on the calendar
  * user is on <calendar_view>
  When user clicks on week or month label
  * user selects date in the date picker
  Then user lands on <landing_view>
  
  Examples:
  |calendar_view|landing_view|
  |week view|week of the selected date|
  |month view|month of the selected date|
