Feature: User sees all slots of a month

Scenario: User sees all slots of a month

Given user is on the list of course parts
When user clicks on the calendar item
Then user sees available slots for the current week
* multiple slots can be shown for a single day
* user sees number of empty places in a given slot
* user can slide between weeks
