Feature: User can update feedback for exam session

Scenario: User can update feedback for exam session

Given user is authenticated
    * user views session in exam mode
    * user has previously added feedback
    When user clicks the "Feedback" button in the bottom menu
    * user updates feedback text or expert name
    Then feedback is updated successfully
    * user can view updated expert feedback in the history tab of the training
