Feature: User can change sorting

Scenario: User can change sorting

Given user has a training
When user opens the Finances tab in any driving session
* training is sorted with <initial_state>
When user changes sorting to <final_state>
Then list is shown with <final_state>

Examples:
|initial_state|final_state|
|Newest first|Oldest first|
|Oldest first|Newest first|
