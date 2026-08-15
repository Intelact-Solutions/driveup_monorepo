Feature: Manage profile settings

  Scenario: Company owner can delete a secondary profile
  
  Given user is company owner
  * user has a secondary profile (e.g. Agent)
  * user is on the profile settings page of the secondary profile
  When user clicks on "Delete Profile"
  * user confirms the deletion
  Then profile is deleted
  * user lands on the Home screen of the owner profile

  Scenario: Company owner can't delete owner profile
  
  Given user is on the driving school profile settings page
  * user is company owner
  * user has no other profile
  When user scrolls to the bottom of the profile
  Then user sees a deactivated "Delete profile" button
  * user sees info note "You can't delete your profile because you are the driving school owner. Please change the driving school owner or delete the driving school account"

  Scenario: Manager with in-charge training can't delete profile
  
  Given user is on the driving school profile settings page
  * user is not company owner
  * user has no other profile
  When user clicks on "Delete Profile"
  Then user is blocked
  * user sees hint to assign own trainings to other instructors

  Scenario: Manager with multiple profiles lands on home page of remaining profile
  
  Given user is on the driving school profile settings page
  * user is not company owner
  * user has multiple profiles
  * user is not in charge of any trainings
  When user deletes own profile
  Then user lands on the Home screen of the remaining profile

  Scenario: Manager with no in-charge training can delete own profile
  
  Given user is on the driving school profile settings page
  * user is not company owner
  * user has no other profile
  When user clicks on "Delete Profile"
  Then user sees info that all appointment will be re-assigned to the in-charge instructor
  * user sees number of total appointments
  * user can confirm the deletion
  * user lands on the Empty Account page

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

  Scenario: User can add new absence period
  
  Given user is on the "Time off" page
  When user enters title for the time off
  * user adds start and end date
  * user clicks "Save"
  Then new time off is added
  * the added time off is shown on user calendar
  * no appointment can be added by other users on the occupied slot

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

  Scenario: User can copy appointments calendar link
  
  Given user is on the "Calender link" page
  When user clicks on the copy button for appointments link
  Then link is copied successfully to the device clipboard

  Scenario: User can deactivate a working day
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has one or more work intervals for a day
  When user clicks on the day toggler
  Then the day is deactivated
  * previously registered work intervals for the day are deleted

  Scenario: User can delete time off
  
  Given user is on the "Time off" page
  * user has at least one Time off
  When user clicks on "Delete"
  * user confirms deletion
  Then Time off is removed

  Scenario: User can edit settings of a profile
  
  Given user has multiple profiles in driveUp
  * user is on the Profile Settings page
  When user clicks on profile <profile_type>
  Then user is redirected to the settings page of the corresponding profile
  * user can edit the settings page for <profile_type>
  * user sees <profile_settings_content>
  
  Examples:
  |profile_type|profile_settings_content|
  |Instructor|Working hours and days, Days-off, Calendar Link, Notification Settings, Delete Account button|
  |Agent|Notification settings, Delete Account button| 
  |Student|Notification settings, Delete Account button|

  Scenario: User can edit time interval
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has a time interval for a day
  When user edits the interval
  Then delete button transforms into the submit button
  * user can submit the change by clicking the submit button

  Scenario: User can edit time off
  
  Given user is on the "Time off" page
  * user has at least one time off
  When user clicks on "Edit"
  Then user can edit start and end date
  * user can edit the title of the Time off

  Scenario: User can remove work interval
  
  Given user is a driving school manager
  * user is on the "Working hours and days" page
  * user has one or more work intervals for a day
  When user clicks on the delete button for a work interval
  Then the work interval is removed

  Scenario: User can view list of notification settings
  
  Given user is on the settings page of one profile
  When user clicks on "Notification settings"
  Then user lands on notifications settings page

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

  Scenario: User sees own profiles
  
  Given user has multiple profiles in driveUp
  When user opens the Profile Settings page
  Then user sees all available profiles
  * and for each profile, user can see the affiliated driving school
  * current profile is highlighted
