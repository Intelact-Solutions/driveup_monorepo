Feature: User can search training through voice-to-text

Scenario: User can search training through voice-to-text

Given user is on the list of trainings
* user has multiple trainings
* user has permitted the app to use the device microphone
When user clicks on the microphone icon
* user pronounces student name
Then speech-to-text mechanism is triggered
* user sees incremental search results after the third letter
* user can click on one of the search results
