Feature: User sees warning message if handover balance is negative

Scenario: User sees warning message if handover balance is negative

Given user is manager
        * user is on the "Cash handover" page
        When the sum of accepted expenses exceeds the sum of included payments
        Then user sees warning message indicating negative handover balance
        * warning message suggests that the instructor should receive cash from the driving school
