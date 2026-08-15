Feature: Student can update rating

Scenario: Student can update rating

Given user is logged in
* user has previously added a rating for the company
* user is on the detailed view of an active training
When user clicks on the three-dot menu icon
Then the last state of student rating is visible
* student can select another rating
* the rating of the student is updated
* a new rating is added for the company
