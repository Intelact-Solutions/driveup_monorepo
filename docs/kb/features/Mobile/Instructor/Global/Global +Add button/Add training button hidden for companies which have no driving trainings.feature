Feature: Add training button hidden for companies which have no driving trainings

Scenario: Add training button hidden for companies which have no driving trainings

Given user is on any page in the application
* user has is in a company which offers only courses
When user clicks on the global "+ Add" button
Then user sees no "Add training"
