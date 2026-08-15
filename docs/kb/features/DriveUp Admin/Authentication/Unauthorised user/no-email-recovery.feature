Feature: No Email recovery

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

  Scenario: User can contact support
  
  Given user is on the "Contact support" page
  When user enters full name
  * user enters an explanation of the situation
  * user uploads documents to prove own identity
  * user submits the form by clicking "Contact support"
  Then form is sent successfully
  * user is shown confirmation that the form was sent
  * user can return to the "Authentication required" screen

  Scenario: User can overwrite existing account from Authentication required screen
  
  Given user is on the "Authentication required" screen
  When user selects the option to "Create new account"
  Then user is redirected to the start screen
  * user can proceed with the creation of the new account
  * old account is overwritten and can't be retrieved anymore

  Scenario: User can overwrite existing account from No recovery email screen
  
  Given user is on the "No recovery email" screen
  When user selects the option to "Create new account"
  Then user is redirected to the sign up screen
  * user can proceed with the creation of the new account
  * old account is overwritten and can't be retrieved anymore

  Scenario: User can't submit form without mandatory data
  
  Given user is on the "Contact support" page
  When has not added Name and Description
  Then user can't submit form

  Scenario: User has not registered a recovery email
  
  Given user has not registered a recovery email
  When user logs in with a new device after 6 month of inactivity
  Then user sees the "No recovery email" screen
  * recovery email option is disabled 
  * user sees a description that shown why the option is disabled
  * user can contact support
  * user can create a new account
