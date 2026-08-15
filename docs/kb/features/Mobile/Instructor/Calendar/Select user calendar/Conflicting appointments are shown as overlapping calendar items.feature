Feature: Conflicting appointments are shown as overlapping calendar items

Scenario: Conflicting appointments are shown as overlapping calendar items

Given user is logged in
* user has multiple appointment in the same time
When user opens the calendar module
Then user sees overlapping appointments in the same slot
