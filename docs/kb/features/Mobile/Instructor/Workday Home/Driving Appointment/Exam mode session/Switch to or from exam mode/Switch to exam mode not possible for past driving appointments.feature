Feature: Switch to exam mode not possible for past driving appointments

Scenario: Switch to exam mode not possible for past driving appointments

Given user is authenticated
    * user views past driving appointment
    When user opens the session menu
    * user clicks "Exam mode"
    Then exam mode option is hidden
