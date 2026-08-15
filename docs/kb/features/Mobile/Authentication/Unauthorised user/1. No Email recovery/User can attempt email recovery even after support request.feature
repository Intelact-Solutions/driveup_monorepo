Feature: User can attempt email recovery even after support request

Scenario: User can attempt email recovery even after support request

Given user can't recover account
* user has submitted a contact form to the support team
When user logs in the app
Then user returns to the "Authentication required" screen
* user sees info message about last sent support request
* info message contains date of last sent support request
* user can attempt email recovery again
* user can send another contact request
* user can overwrite existing account
