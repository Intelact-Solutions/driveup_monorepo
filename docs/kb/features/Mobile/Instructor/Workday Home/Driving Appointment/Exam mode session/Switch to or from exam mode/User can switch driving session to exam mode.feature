Feature: User can switch driving session to exam mode

Scenario: User can switch driving session to exam mode

Given user is authenticated
    * user is in the driving session
    When user opens the session menu
    * user clicks "Exam mode"
    Then appointment is shown in exam mode
