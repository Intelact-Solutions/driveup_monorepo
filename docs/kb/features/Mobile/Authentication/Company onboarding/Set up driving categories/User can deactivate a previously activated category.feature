Feature: User can deactivate a previously activated category

Scenario: User can deactivate a previously activated category

Given user is on the "Category Settings" screen
And user has previously activated a category
When user clicks on the button to deactivate a category
Then the category does not appear with a checkmark on the list
