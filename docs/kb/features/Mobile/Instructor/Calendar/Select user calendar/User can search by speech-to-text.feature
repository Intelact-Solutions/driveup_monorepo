Feature: User can search by speech-to-text

Scenario: User can search by speech-to-text

Given user is on the default calendar view
* user has given driveUp permission to access the microphone
When user clicks on the top left menu icon
* user clicks on the microphone icon
* user pronounces a search string
Then search string is added in the search field
* list is filtered for instructors with matching names
