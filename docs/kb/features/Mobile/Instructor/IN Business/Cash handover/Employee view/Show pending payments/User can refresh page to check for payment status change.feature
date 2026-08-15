Feature: User can refresh page to check for payment status change

Scenario: User can refresh page to check for payment status change

Given user is instructor
        * user is on the "Cash handover" page
        When manager changes the status of a payment
        * instructor clicks the refresh button
        Then the state of the handover items is updated
