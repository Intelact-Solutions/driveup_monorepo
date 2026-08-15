Feature: Clicking on the finances card redirects to Payment tab

Scenario: Clicking on the finances card redirects to Payment tab

Given user is logged in
* user has an active driving training
When user opens the detailed view of a driving training
* user scrolls to the training finances
* user clicks on the finances card
Then user is redirected to the "Payments" tab for a more detailed overview
