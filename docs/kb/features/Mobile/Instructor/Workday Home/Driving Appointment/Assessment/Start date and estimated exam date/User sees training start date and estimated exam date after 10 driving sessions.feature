Feature: User sees training start date and estimated exam date after 10 driving sessions

Scenario: User sees training start date and estimated exam date after 10 driving sessions

Given user has a trainining
        * user has had at least 10 driving sessions
        When user opens the assessment tab of the training
        Then user sees training start date
        * user sees estimated exam date
        * user sees number of days left until estimated exam date
