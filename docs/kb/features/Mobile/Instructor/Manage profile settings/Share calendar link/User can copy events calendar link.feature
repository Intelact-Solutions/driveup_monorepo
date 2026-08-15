Feature: User can copy events calendar link

Scenario: User can copy events calendar link

Given user is on the "Calender link" page
When user clicks on the copy button for events link
Then link is copied successfully to the device clipboard
