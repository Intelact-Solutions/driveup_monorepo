Feature: User can copy appointments calendar link

Scenario: User can copy appointments calendar link

Given user is on the "Calender link" page
When user clicks on the copy button for appointments link
Then link is copied successfully to the device clipboard
