Feature: User can open detailed summary

Scenario: User can open detailed summary

Given user is on the "Payment tab" of a driving training
When user clicks "Show details" below the Balance and Payments header
Then a more detailed summary of finances is expanded
* summary shows the following fields
|Administration fee|Total sessions fee| Discounts | Total cost| Payments| Refunds | Total Paid |
