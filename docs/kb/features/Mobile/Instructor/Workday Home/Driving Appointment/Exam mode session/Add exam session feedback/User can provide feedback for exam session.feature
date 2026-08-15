Feature: User can provide feedback for exam session

Scenario: User can provide feedback for exam session

Given user is authenticated
    * user views session in exam mode
    When user clicks on "Feedback" button in the bottom menu
    * user enters expert name
    * user enters feedback text
    Then new feedback is saved
    * user can view expert feedback in the history tab of the training
