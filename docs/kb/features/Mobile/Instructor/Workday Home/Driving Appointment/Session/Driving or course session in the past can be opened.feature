Feature: Driving or course session in the past can be opened

Scenario: Driving or course session in the past can be opened

Given user has a driving or course session in a past day
When user goes to calendar
* user clicks on the appointment in the past
* user clicks on the button "Open session" (de: Sitzung öffnen, it: Apri sessione, fr: Ouvrir la session )
Then user lands in the corresponding session
* user has the right to edit
