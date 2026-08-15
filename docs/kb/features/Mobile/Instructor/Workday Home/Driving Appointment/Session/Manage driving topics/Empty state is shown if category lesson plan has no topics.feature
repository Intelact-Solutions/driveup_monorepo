Feature: Empty state is shown if category lesson plan has no topics

Scenario: Empty state is shown if category lesson plan has no topics

Given user is authenticated
        * user has an upcoming driving session in a category
        * user has no topics for the category
        When user opens the driving session
        Then user sees an empty state
        * user is informed that the category lesson plan is managed in the back office
