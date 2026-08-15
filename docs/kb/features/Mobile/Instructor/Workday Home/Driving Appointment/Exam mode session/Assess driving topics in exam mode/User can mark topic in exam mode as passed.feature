Feature: User can mark topic in exam mode as passed

Scenario: User can mark topic in exam mode as passed

Given user is authenticated
    * user views session in exam mode
    When user clicks on "Passed" button for a topic
    Then the "passed" icon is highlighted
    * user can undo the passed status
