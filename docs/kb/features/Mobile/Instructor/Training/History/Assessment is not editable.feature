Feature: Assessment is not editable

Scenario: Assessment is not editable

Given user is on the History tab of a training
When user clicks on a session to view its details
* user expands topic to view skills assessment
Then skill assessment is not editable
