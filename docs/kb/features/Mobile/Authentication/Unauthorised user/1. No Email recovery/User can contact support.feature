Feature: User can contact support

Scenario: User can contact support

Given user is on the "Contact support" page
When user enters full name
* user enters an explanation of the situation
* user uploads documents to prove own identity
* user submits the form by clicking "Contact support"
Then form is sent successfully
* user is shown confirmation that the form was sent
