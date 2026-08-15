Feature: Administration fee is not mandatory

Scenario: Administration fee is not mandatory

Given user is on the "Category Settings" screen
  When user enters a session duration
  * user enters a price
  * user leaves the administration fee field empty
  * user clicks on "Submit"
  Then the category should be saved successfully
