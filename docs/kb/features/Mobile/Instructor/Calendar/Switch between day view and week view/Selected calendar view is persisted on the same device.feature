Feature: Selected calendar view is persisted on the same device

Scenario: Selected calendar view is persisted on the same device

Given user is on the calendar
* user is on the <initial> view
When user switches to <target> view
* user moves to another page in the app
* user returns to calendar
Then user sees calendar in the <target> view as long as the same device is used

Examples:
|initial|target|
|day|week|
|week|day|
