Feature: User can continue training after passing exam

Scenario: User can continue training after passing exam

Given user is authenticated
    * user views session in exam mode
    * user has marked the exam as passed
    When user clicks on "Continue with training" button
    * training remains active
    * topic status and skill assessment is not affected by exam results
