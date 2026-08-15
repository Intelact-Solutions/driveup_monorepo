Feature: User can see deteils of cancelled item

Scenario: User can see deteils of cancelled item

Given user has a training
* training has generated costs
* user has approved payments for the student
When manager cancels a payment in the admin
Then instructor sees cancellation item in the financial flow on mobile
* user can expand cancellation item to see cancelled transaction's item
