Feature: User can swipe between driving sessions in history

Scenario: User can swipe between driving sessions in history

Given user is authenticated
        * user has opened a driving session
        * user is on the history tab
        When user swipes left on the session card
        Then user sees the previous driving session
        * user can swipe left to see older sessions
        * user can swipe right to see newer sessions
