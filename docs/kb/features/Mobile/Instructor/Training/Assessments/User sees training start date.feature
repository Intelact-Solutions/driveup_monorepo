Feature: User sees training start date

Scenario: User sees training start date

Given user has a training      
        When user opens the assessment tab of the training
        Then user sees training start date
        * user does not see estimated exam date before the completion of the 10th appointment
        * user does not see number of days left until the estimated exam date before the completion of the 10th appointment
