Feature: User can see Appointments card

Scenario: User can see Appointments card

Given user has a training
When user opens training detailed view
Then user sees card "Appointments"
* user sees number of upcoming appointments
* user can click on the card to see detailed list of appotinments
