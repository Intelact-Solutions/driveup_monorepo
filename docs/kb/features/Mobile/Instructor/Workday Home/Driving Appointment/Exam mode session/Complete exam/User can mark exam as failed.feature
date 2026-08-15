Feature: User can mark exam as failed

Scenario: User can mark exam as failed

Given user is authenticated
    * user views session in exam mode
    When user clicks on "Failed" button in the bottom menu
    Then exam session is marked as failed
    * user can view the updated status in the training history tab
