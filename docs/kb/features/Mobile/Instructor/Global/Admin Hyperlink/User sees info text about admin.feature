Feature: User sees info text about admin

Scenario: User sees info text about admin

Given user is manager
* user is logged in
When user clicks on the "Admin" button
Then user sees popup with details about the admin page
* the popup contains button "Got it", which closes the popup
* the popup contains button "Open Admin Platform", which redirects user to the prod admin page
* the popup contains info text
