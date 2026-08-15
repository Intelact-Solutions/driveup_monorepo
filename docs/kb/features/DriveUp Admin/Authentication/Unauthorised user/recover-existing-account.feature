Feature: Recover existing account

  Scenario: User can log out
  
  Given user is on the "Authentication required" screen
  When user clicks "Logout"
  Then user is logged
  * user returns to the Start page

  Scenario: User can recover account by email verification code
  
  Given user is on the "Enter recovery email" screen
  When user enters correct email address
  * user clicks "Verify"
  Then user receives a verification code per email
  And user can proceed with the account recovery process

  Scenario: User can resend code
  
  Given user has submitted a matching email address
  * user has received a verification code per email
  When user clicks "Resend"
  Then a new email is sent
  * previously valid code is invalidated

  Scenario: User can trigger recovery process by email
  
  Given user has previously added a recovery email
  * user is on the account recovery screen
  When user selects "Recovery mail" option
  * user clicks "Next"
  Then user lands on the next page of the process

  Scenario: User can verify account with correct verification code
  
  Given user has submitted a matching email address
  * user has received a verification code per email
  * user is on the "Enter verification code" page
  When user enters correct verification code
  Then user lands on the success page
  * user can proceed to use the app by clicking "Continue"

  Scenario: User can't login with an expired confirmation code
  
  Given user has submitted a matching email address
  * user has received a verification code per email
  * verification code has expired
  When user enters the expired code
  Then system rejects the code
  * user sees a message saying "The code has expired."

  Scenario: User can't proceed if email does not match
  
  Given user is on the "Enter recovery email" screen
  When user enters an email address which does not match
  Then user sees an error message
  * user can correct the email address
  * user can cancel the process and return to the "Authentication required" screen

  Scenario: User can't verify account with wrong code input
  
  Given user has submitted a matching email address
  * user has received a verification code per email
  * user is on the "Enter verification code" page
  When user enters code incorrectly
  Then user sees an error message
  * user can edit the code to correct it
  * user can proceed after correcting a wrong input

  Scenario: User sees account recovery screen if inactive for more than 6 months
  
  Given user has not opened the app for more than 6 months
  * user has previously added a recovery email
  * user is on a new device
  When user starts the app
  * user authenticates through phone number
  Then user sees account recovery screen
