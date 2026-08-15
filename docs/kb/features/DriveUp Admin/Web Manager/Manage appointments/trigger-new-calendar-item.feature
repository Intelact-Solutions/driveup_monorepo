Feature: Trigger new calendar item

  Scenario: Trigger new calendar item by clicking +Add New button
  
  Given user is on the calendar
  When user clicks on the "+Add new" button on the header
  Then user sees the form to add a new calendar item
  * "Session" is selected as default type
  * selected instructor is automatically added as instructor
  * instructor is not editable
  * time and date is empty

  Scenario: Trigger new calendar item by clicking on slot
  
  Given user is on the calendar
  When user clicks on an empty slot
  Then user sees the form to add a new calendar item
  * "Session" is selected as default type
  * selected instructor is automatically added as instructor
  * instructor is not editable
  * time and date are pre-defined but editable

  Scenario: User can cancel new calendar item popup
  
  Given user is on the calendar
  * user has triggered the form to add new item
  When user clicks "Cancel"
  Then form is not saved
