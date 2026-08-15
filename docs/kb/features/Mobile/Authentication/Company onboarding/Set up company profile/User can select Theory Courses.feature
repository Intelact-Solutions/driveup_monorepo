Feature: User can select Theory Courses

Scenario: User can select Theory Courses

Given user is authenticated
* user has selected onboarding as a driving school
* user is on the "Select services" page
When user selects only "Theory services"
* user clicks Next
Then user skips the category selection page on the onboarding process
