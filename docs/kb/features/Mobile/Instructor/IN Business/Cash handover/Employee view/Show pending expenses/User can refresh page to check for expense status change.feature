Feature: User can refresh page to check for expense status change

Scenario: User can refresh page to check for expense status change

Given user is instructor
        * user is on the "Cash handover" page
        When manager changes the status of an expense
        * instructor clicks the refresh button
        Then the state of the handover expenses is updated
