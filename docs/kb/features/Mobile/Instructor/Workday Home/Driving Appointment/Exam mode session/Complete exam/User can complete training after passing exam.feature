Feature: User can complete training after passing exam

Scenario: User can complete training after passing exam

Given user is authenticated
    * user views session in exam mode
    * user has marked the exam as passed
    When user clicks on "Complete training & archive" button
    Then training is marked as completed
    * user can view the completed training in the archived trainings list
    * all upcoming user appointments are cancelled automatically
