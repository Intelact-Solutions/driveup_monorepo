Feature: User can update a signature in a session

Scenario: User can update a signature in a session

Given user is authenticated
        * user is in the driving session
        * user has previously added a signature
        When user opens the signature section
        * user clicks the update icon for a signature
        * user enters a new signature
        * user submits the new signature
        Then the signature is updated
        * user can see the updated signature in the session signature popup
