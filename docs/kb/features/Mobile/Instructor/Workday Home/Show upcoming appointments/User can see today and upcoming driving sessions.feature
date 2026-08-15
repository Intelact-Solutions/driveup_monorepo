Feature: User can see today and upcoming driving sessions

Scenario: User can see today and upcoming driving sessions

Given user is authenticated
        * user has driving sessions for today and in the following days
        When user opens the Workday home page
        Then user sees driving sessions for today in the list
        * user sees driving sessions for the following days in the list
        * user sees start and end time of each driving session
        * user sees student profile picture and name
        * user sees category label
        * user sees pickup location if pickup location is registered
        * user sees "No Pickup Location is registered" if pickup location is not registered
