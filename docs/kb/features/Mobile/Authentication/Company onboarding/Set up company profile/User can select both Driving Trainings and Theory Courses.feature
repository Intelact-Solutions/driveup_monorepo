Feature: User can select both Driving Trainings and Theory Courses

Scenario: User can select both Driving Trainings and Theory Courses

Given user is authenticated
* user has selected onboarding as a driving school
* user is on the "Select services" page
When user selects "Driving trainings"
* user selects "Theory Courses"
* user clicks Next
Then user sees category selection page on the onboarding process
