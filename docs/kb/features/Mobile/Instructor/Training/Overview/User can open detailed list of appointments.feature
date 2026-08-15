Feature: User can open detailed list of appointments

Scenario: User can open detailed list of appointments

Given user is on the "Overview" tab of a training
When user clicks on the "Appointments" card
Then user sees detailed list of appointments
* user sees fulls list of appointments in the training
* past appointments are greyed-out
* cancelled appointments are shown with a "Cancelled" badge
