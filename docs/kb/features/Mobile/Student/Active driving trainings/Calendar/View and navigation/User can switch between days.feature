Feature: User can switch between days

Scenario: User can switch between days

Given user is on "Calendar" view page 
* user is on current day 
When user clicks the <chevron>
Then user is taken to the <day>
* and user can switch between time periods

Examples:
|chevron|day|
|left chevron|previous day|
|right chevron|next day|
