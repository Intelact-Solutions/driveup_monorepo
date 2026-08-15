Feature: User can mark exam as passed

Scenario: User can mark exam as passed

Given user is authenticated
    * user views session in exam mode
    When user clicks on "Passed" button in the bottom menu
    Then user sees the "Congratulations" message
    * user can click "Continue with training" button to keep the training active
    * user can click "Complete training & archive" button to complete the training
