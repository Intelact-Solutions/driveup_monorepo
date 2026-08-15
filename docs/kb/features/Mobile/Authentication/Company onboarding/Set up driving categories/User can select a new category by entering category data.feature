Feature: User can select a new category by entering category data

Scenario: User can select a new category by entering category data

Given user is on the "Select Categories" screen
  When user clicks on a category that is not selected
  * system displays the "Category Settings" screen
  * user enters a session duration
  * user enters a price
  * user optionally enters an administration fee
  * user clicks on "Submit"
  Then the selected category should be added to the list of selected categories
  * category should appear with a checkmark in the "Select Categories" screen
