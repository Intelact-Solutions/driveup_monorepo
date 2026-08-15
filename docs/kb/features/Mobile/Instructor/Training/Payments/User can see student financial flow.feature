Feature: User can see student financial flow

Scenario: User can see student financial flow

Given user has a training
* training has generated costs
* student has made multiple transactions
When user opens "Payments" tab
* user scrolls to section "Financial Flow"
Then user sees a detailed flow of every transaction
* user sees different transaction types
|payment|refund|discount|
* user sees different cancellation items for each transaction type
|payment cancellation item|refund cancellation item|discount cancellation item|
* for each transaction, user sees following elements
|Icon|Transaction type|Amount|Date and Time|Registered by |
* if transaction not approved, user sees edit and delete button
