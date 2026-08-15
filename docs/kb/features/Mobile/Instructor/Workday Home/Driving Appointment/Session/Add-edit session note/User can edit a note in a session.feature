Feature: User can edit a note in a session

Scenario: User can edit a note in a session

Given user is authenticated
        * user is in the driving session
        * user has previously added a note for past sessions
        When user opens the notes section
        * user clicks the edit icon for a note
        * user modifies the note
        * user submits the changes
        Then the note is updated
        * user can see the updated note in the list of session notes
