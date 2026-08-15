Feature: User can submit company data

Scenario: User can submit company data

Given user is on the "Enter company information" page
  When user enters company name
  Then user can proceed to the next page
