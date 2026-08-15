Feature: User can add a note for the current session

Scenario: User can add a note for the current session

Given user is authenticated
        * user is in the driving session
        When user opens the notes section
        * user enters a note
        * user closes the notes section
        Then the note is saved
        * user can see the note after opening the notes section again
        * the note stays editable
        * notes are shown with the newest on top
