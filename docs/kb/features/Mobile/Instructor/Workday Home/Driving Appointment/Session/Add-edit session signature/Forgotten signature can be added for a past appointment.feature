Feature: Forgotten signature can be added for a past appointment

Scenario: Forgotten signature can be added for a past appointment

Given user is authenticated
        * user has a past driving session
        * user has not added a signature
        When user goes to the Trainings module
        * user selects training
        * user goes to the "History" tab
        * user opens detailed view of the past session
        * user clicks "Add signature"
        Then user can add signature
        * the signature is saved for the past appointment
