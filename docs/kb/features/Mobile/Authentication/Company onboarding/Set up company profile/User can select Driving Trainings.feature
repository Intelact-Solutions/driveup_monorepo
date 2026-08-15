Feature: User can select Driving Trainings

Scenario: User can select Driving Trainings

Given user is authenticated
* user has selected onboarding as a driving school
* user is on the "Select services" page
When user selects only "Driving trainings"
* user clicks Next
Then user sees category selection page on the onboarding process
