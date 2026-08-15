Feature: Fallback default language is English

Scenario: Fallback default language is English

Given user has not selected a language before
* device language is NOT supported by the app
When user starts the app
Then user sees the start page in English
