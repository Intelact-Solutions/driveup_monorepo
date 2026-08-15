Feature: User can search training through text input

Scenario: User can search training through text input

Given user is on the list of trainings
When user enters a search item into the search field 
Then user sees incremental search results after entering the third letter
* user can click on one of the search results
