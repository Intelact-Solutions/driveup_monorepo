Feature: User can mark topic in exam mode as failed

Scenario: User can mark topic in exam mode as failed

Given user is authenticated
    * user views session in exam mode
    When user clicks on "Failed" button for a topic
    Then the "failed" icon is highlighted
    * user can undo the failed status
