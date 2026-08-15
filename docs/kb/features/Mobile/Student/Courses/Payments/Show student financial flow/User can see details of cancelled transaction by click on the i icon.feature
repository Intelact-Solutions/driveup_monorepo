Feature: User can see details of cancelled transaction by click on the i icon

Scenario: User can see details of cancelled transaction by click on the i icon

Given user is on the financial flow
* user has cancelled at least one transcation
When user clicks on the i icon on the cancellation item
Then user sees the details of the cancelled transaction
|type|amount|time & date| registered by |
