Feature: User can filter financial flow by date

Scenario: User can filter financial flow by date

Given user is on the training "Payment" tab
* user has items in the financial flow
When user clicks on the date filter
* user selects a date range
Then user sees only financial flow items for the selected period
