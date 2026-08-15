Feature: User can delete a signature from a session

Scenario: User can delete a signature from a session

Given user is authenticated
        * user is in the driving session
        * user has previously added a signature
        When user opens the signature section
        * user clicks the update icon for a signature
        * user does not register a new signature
        * user clicks on the submit button
        Then the signature is removed
        * user can no longer see the signature in the session signature popup
