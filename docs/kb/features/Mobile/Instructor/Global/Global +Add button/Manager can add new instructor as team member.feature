Feature: Manager can add new instructor as team member

Scenario: Manager can add new instructor as team member

Given user is a manager
* user is logged in
When user clicks on the global Add button
* user clicks on "Team member" (de: Teammitglied)
* user fills out all the mandatory fields
* user submits the form
Then a new invitation is sent to the instructor
* user sees success message, with the content "You have successfully invited a new instructor. For a more comprehensive management of your team, please go to the Team Management module of the admin platform"
