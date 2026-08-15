Feature: User can add a signature to a session

Scenario: User can add a signature to a session

Given user is authenticated
        * user is in the driving session
        When user opens the signature section
        * user enters a signature
        * user submits the signature
        Then the signature is saved
        * user can see the signature in the list of session signatures
