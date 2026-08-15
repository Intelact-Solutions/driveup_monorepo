Feature: User can change sorting

Scenario: User can change sorting

Given user has a training
* training is sorted with <initial_state> on top
When user changes sorting to <final_state> on top
Then list is shown with <final_state> on top

Examples:
|initial_state|final_state|
|Newest first|Oldest first|
|Oldest first|Newest first|
