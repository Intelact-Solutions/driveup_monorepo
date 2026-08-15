Feature: Show Start page on device language if supported

Scenario: Show Start page on device language if supported

Given user has not selected a language before
* device language is supported by the app
When user starts the app
Then user sees the start page in device language
