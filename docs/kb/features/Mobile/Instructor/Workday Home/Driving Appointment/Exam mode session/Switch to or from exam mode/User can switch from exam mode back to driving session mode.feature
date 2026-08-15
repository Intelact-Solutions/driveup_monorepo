Feature: User can switch from exam mode back to driving session mode

Scenario: User can switch from exam mode back to driving session mode

Given user is authenticated
    * user views session in exam mode
    When user opens the session menu
    * user clicks "Exit exam mode"
    Then appointment is shown in driving session mode
