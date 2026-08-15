Feature: User can delete a note from a session

Scenario: User can delete a note from a session

Given user is authenticated
        * user is in the driving session
        * user has previously added a note
        When user opens the notes section
        * user clicks the "Delete" button for a note
        * user confirms the deletion
        Then the note is removed
        * user can no longer see the note in the list of session notes
