Feature: Change company owner

  Scenario: User can change company owner
  
  Given user is company owner
  * user has at least one other user in the company
  When user opens the "Company owner" page
  * user selects another person as owner
  * user clicks on "Verify"
  Then user receives a confirmation SMS
  * user can enter the confirmation code 
  * company owner is changed
  * former company owner continues to exist as a user with the role "Manager"
