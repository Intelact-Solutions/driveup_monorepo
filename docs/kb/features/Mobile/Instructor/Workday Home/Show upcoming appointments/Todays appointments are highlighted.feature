Feature: Todays appointments are highlighted

Scenario: Todays appointments are highlighted

Given user is authenticated
        * user has appointments for today and the following days
        * user is on the Workday home page
        When user views the list of sessions
        Then the sessions for today are highlighted
        * upcoming sessions are not highlighted
