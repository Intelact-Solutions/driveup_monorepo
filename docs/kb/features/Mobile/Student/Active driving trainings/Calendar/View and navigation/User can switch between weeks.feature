Feature: User can switch between weeks

Scenario: User can switch between weeks

Given user is on "Calendar" view page 
* user is on current week
When user clicks the <chevron>
Then user is taken to the <week>
* and user can switch between time periods

Examples:
|chevron|week|
|left chevron|previous week|
|right chevron|next week|
