Feature: User can assign driving training to another instructor

Scenario: User can assign driving training to another instructor

Given user is on the Overview tab of a training
When user clicks on the in-charge instructor field
Then user sees list of all active instructors in the company
* no availability status is shown
* popup is called "Fahrausbildung zuweisen"
* user can select instructor and submit form
