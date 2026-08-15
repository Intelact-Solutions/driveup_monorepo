Feature: Session duration and price are mandatory

Scenario: Session duration and price are mandatory

Given user is on the "Category Settings" screen
  When user leaves the <field> empty
  * user enters a price
  * user clicks on "Next"
  Then system should display an error message for missing <field>
  
  Examples:
  |field|
  |session duration|
  |price|
