Feature: User sees error message if mandatory data are missing

Scenario: User sees error message if mandatory data are missing

Given user is on the "Enter company information" page
  When user does not enter company name
  * user clicks "Next"
  Then user sees an error message
