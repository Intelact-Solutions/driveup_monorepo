Feature: User sees number of active and archived trainings

Scenario: User sees number of active and archived trainings

Given user is on the Home page
* user has at least one active and archived training
When user opens "Students" module
Then user sees number of active trainings in brackets inside the tab
* user sees number of archived trainings in brackets inside the tab
