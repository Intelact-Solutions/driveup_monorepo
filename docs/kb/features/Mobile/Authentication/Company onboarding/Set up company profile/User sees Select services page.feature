Feature: User sees Select services page

Scenario: User sees Select services page

Given user is authenticated
When user selects to do onboarding as a driving school
* user clicks on Next
Then user sees "Select services" page
* user sees selection options
|Driving Trainings| Theory Courses|
