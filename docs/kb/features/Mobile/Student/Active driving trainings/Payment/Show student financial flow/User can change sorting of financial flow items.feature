Feature: User can change sorting of financial flow items

Scenario: User can change sorting of financial flow items

Given user is on the "Payment tab" of a driving training
* user views the financial flow
* default sorting is date descending
When user clicks on the sort icon
* user changes sorting to date ascending
Then the order of financial flow items is changed accordingly
