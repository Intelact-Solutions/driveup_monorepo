Feature: User sees only training start date if less than 10 driving sessions

Scenario: User sees only training start date if less than 10 driving sessions

Given user has a training
        * user has had less than 10 driving sessions
        When user opens the assessment tab of the training
        Then user sees training start date
        * user does not see estimated exam date
        * user does not see number of days left until the estimated exam date
