Feature: Manage holidays

  Scenario: User can add new holiday period
  
  Given user is on the "Holidays" page
  When user enters title for the holiday
  * user adds start and end date
  * user clicks "Save"
  Then new holiday is added
  * added holiday is shown on user calendar
  * added holiday is visible on the calendar of all the team members

  Scenario: User can delete holiday
  
  Given user is on the "Holidays" page
  * user has at least one holiday
  When user clicks on "Delete"
  * user confirms deletion
  Then holiday is removed

  Scenario: User can edit holiday
  
  Given user is on the "Holidays" page
  * user has at least one holiday
  When user clicks on "Edit"
  Then user can edit start and end date
  * user can edit the title of the absence period
