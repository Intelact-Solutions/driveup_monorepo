Feature: Clear selected financial flow filter

Scenario: Clear selected financial flow filter

Given user is on the training "Payment" tab
* user has filtered the financial flow by date
When user clicks "Clear filter"
Then the date filter is removed
* user sees the full financial flow
