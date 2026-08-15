Feature: User can activate multiple categories

Scenario: User can activate multiple categories

Given user is on the "Category Settings" screen
And user has already activated a category
When user clicks on a category that is not activated
  * system displays the "Category Settings" screen
  * user enters a session duration
  * user enters a price
  * user optionally enters an administration fee
  * user clicks on "Submit"
  Then the selected category should be added to the list of selected categories in the app
  * category should appear with a checkmark in the "Select Categories" screen
