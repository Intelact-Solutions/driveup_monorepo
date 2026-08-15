Feature: Add+Edit pickup locations

  Scenario: User can add a new pick-up location
  
  Given user is on the "Pickup location" page
  When enters a title in the empty form
  * user enters address
  * user clicks "Save"
  Then new pickup location is shown in the list
  * pickup location is selectable for the user in the driving appointment view

  Scenario: User can edit an existing pick-up location
  
  Given user is on the "Pickup location" page
  * and user has at least one pickup location
  When user clicks "Edit"
  Then user can edit the pickup location title and address
  * the pickup location is updated

  Scenario: User can remove a pick-up location
  
  Given user is on the "Pickup location" page
  * and user has at least one pickup location
  When user clicks "Delete"
  * user confirms the deletion
  Then the pickup location is deleted
  * pickup location is not available for the user in the driving appointment view
