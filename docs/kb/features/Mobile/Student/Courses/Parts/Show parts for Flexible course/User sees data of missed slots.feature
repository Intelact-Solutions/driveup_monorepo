Feature: User sees data of missed slots

Scenario: User sees data of missed slots

Given user has booked a slot for a part
* user has not participated
When user opens list of course parts
Then user sees list of missed slots inside the corresponding course parts
* each item is highlighted red
* each item shows date and time
* if upcoming slot booked for the part, user sees date and time below the part name
* if no upcoming slot booked, user sees "Slot not selected" label below the part name
