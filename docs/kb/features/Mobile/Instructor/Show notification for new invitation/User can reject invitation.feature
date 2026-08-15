Feature: User can reject invitation

Scenario: User can reject invitation

Given user has an already active profile
* user has received a new invitation to join driveUp
When user clicks on the notification
* user clicks "Reject"
Then invitation screen is closed
* user remains on the Profile settings page
* notification is not shown anymore
