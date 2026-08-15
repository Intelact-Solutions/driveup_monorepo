Feature: Working days-hours

  Scenario: Overlapping time intervals are merged
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  When user submits a time interval for a day
  * the submitted intervals overlaps with the existing interval(s)
  Then overlapping intervals are merged into a single interval

  Scenario: User can add multiple work intervals for a single day
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has already added one or more work intervals for a day
  When user clicks on the + icon
  * user submits a new interval
  Then a second work interval is saved for the user

  Scenario: User can add work interval
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * and at least one day has no added interval
  When user clicks on the + icon of the empty day
  * user enters "from" time and "to" time
  * user clicks submit icon for the interval
  Then new work interval is saved for the user
  * The toggler for the day is activated
  * field remains editable
  * submit button changes to delete button

  Scenario: User can deactivate a working day
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has one or more work intervals for a day
  When user clicks on the day toggler
  Then the day is deactivated
  * previously registered work intervals for the day are deleted

  Scenario: User can edit time interval
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has a time interval for a day
  When user edits the interval
  Then delete button transforms into the submit button
  * user can submit the change by clicking the submit button

  Scenario: User can remove work interval
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has one or more work intervals for a day
  When user clicks on the delete button for a work interval
  Then the work interval is removed

  Scenario: User can view working hours and days
  
  Given user is a driving school manager
  * user is on the company profile settings page
  When user clicks on "Working hours and days"
  Then user can company default working hours and days

  Scenario: User cannot submit work interval with from time after to time
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  When user clicks on the + icon of a day
  * user enters "from" time after "to" time
  Then submit button stays disabled
  * clicking on the submit button displays an error message "End Time cannot be before Start Time"
