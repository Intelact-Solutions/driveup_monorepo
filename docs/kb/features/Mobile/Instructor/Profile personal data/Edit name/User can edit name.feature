Feature: User can edit name

Scenario: User can edit name

Given user is on the Profile Settings page
    When user clicks on the Personal Information field
    * user updates their name
    * user leaves field
    Then updated name is saved
    * updated name should be displayed on the Profile Settings page
