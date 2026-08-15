Feature: User can search for instructor to view calendar

Scenario: User can search for instructor to view calendar

Given user is on the default calendar view
When user clicks on the top left menu icon
* user enters matching string in the search field
Then list is filtered for instructors with matching name
