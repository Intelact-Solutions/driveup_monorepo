Feature: User can edit phone number

Scenario: User can edit phone number

Given user is on the Profile Settings page
    When user clicks on the Phone Number field
    * user updates their phone number
    * user successfully submits the newly received confirmation code
    Then new phone number is saved
    * user can use the new phone number in his next authentication process
