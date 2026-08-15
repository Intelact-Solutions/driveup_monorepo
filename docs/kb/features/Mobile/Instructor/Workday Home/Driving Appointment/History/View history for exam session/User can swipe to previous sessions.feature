Feature: User can swipe to previous sessions

Scenario: User can swipe to previous sessions

Given user is authenticated
        * user has opened an exam appointment
        * user is on the history tab
        When user swipes left on the session card
        Then user sees the previous driving session
        * user can swipe left to see older sessions
        * user can swipe right to see newer sessions
