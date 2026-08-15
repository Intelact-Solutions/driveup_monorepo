Feature: Start app

  Scenario: Countries are sorted alphabetically on search field
  Given the user is on the Start page of the DriveUp app (https://test.driveup.pro/auth/signin)
  When user clicks on the country code
  Then user sees a list of countries
  * countries are sorted alphabetically

  Scenario: Country code input is ignored
  Given user is on the start page
  * user has selected country Switzerland +41
  When user enters phone number +41782521877
  Then system ignores country code in the input field
  * phone number without country code duplication is sent in the submit

  Scenario: Fallback default language is English
  Given user has not selected a language before
  * device language is NOT supported by the app
  When user starts the app
  Then user sees the start page in English

  Scenario: Leading zero is ignored
  Given user in on the start page
  * user has selected country Switzerland +41
  When user enters phone number with leading zero e.g. 0712521877
  Then leading zero is ignored
  * the number submitted is +41782521877

  Scenario: Show Start page on device language if supported
  Given user has not selected a language before
  * device language is supported by the app
  When user starts the app
  Then user sees the start page in device language

  Scenario: User can add phone number
  Given user is on the start page
  When user enters a valid phone number
  * user clicks "Start"
  Then user receives an SMS confirmation code
  * user can proceed to the next step

  Scenario: User can correct wrong phone number input after error message
  Given the user enters a phone number in an incorrect format
  * the system displays an error message saying "Please enter a valid phone number"
  When the user corrects the phone number format
  Then the phone number is accepted
  And the user can proceed to the next step

  Scenario: User can open Terms & Conditions and Privacy Policy URL
  Given the user is on the Start page of the DriveUp app
  When the user taps on the "Terms & Conditions" or the "Privacy Policy" link
  Then the app should open the corresponding URL in a browser

  Scenario: User can register with new number after getting blocked on another number
  Given user is on the start page
  * user is on the confirmation code page for a specific number
  When user enters the verification code wronlgy 5 times
  * user returns to the start page
  * user enters a new number
  Then user can proceed successfully

  Scenario: User can request max. 5 verification codes in one hour
  Given user has submitted phone number
  * user has received an initial verification code per SMS
  * user has resent the verification code 4 times in an hour
  When user clicks "Resend" a 5th time in an hour
  Then the "Resend" button remains disabled
  * user sees message "Resend will be available in 1 h"

  Scenario: User can resend code
  Given user has submitted phone number
  * user has received no SMS with a verification code
  When user clicks "Resend"
  Then a new SMS is sent
  * previously valid code is invalidated
  * "Resend" button is disabled for the next 60 seconds

  Scenario: User can select country code
  Given user is on the start page
  When user clicks on the country code
  Then user sees a list of countries
  * user can select a country

  Scenario: User can verify phone number with correct verification code
  Given user with role <role> has submitted a phone number
  * user has received a verification code per SMS
  * user is on the "Enter verification code" page
  When user enters code correctly
  * user clicks "Next"
  Then user lands on <page>
  
  Examples:
  | role                                   | page                           |
  | Instructor (active)                    | Instructor home screen         |
  | Student (active)                        | Student home screen            |
  | Agent (active)                          | Agent home screen              |
  | Invited user without existing profile in another role | Onboarding first page |
  | Invited user with existing profile in another role  | Home screen           |
  | Unregistered user                       | Sign up page                   |

  Scenario: User can't add phone number with wrong format
  Given user is on the start page
  When user enters a phone number in an incorrect format
  Then system displays an error message saying "Please enter a valid phone number"
  * user cannot proceed to the next step

  Scenario: User can't login with an expired confirmation code
  Given user enters their phone number to receive a confirmation code
  * confirmation code has expired
  When user enters the expired code
  Then system rejects the code
  * user sees a message saying "The code has expired"

  Scenario: User can't verify phone number with wrong code input
  Given user has submitted an existing phone number
  * user has received a verification code per SMS
  * user is on the "Enter verification code" page
  When user enters code incorrectly
  Then user sees an error message
  * user can edit the code to correct it
  * user can proceed after correcting a wrong input

  Scenario: User is blocked for 1 hour if confirmation code entered wrongly 5 times
  Given user has received a verification code per SMS
  * user has entered the confirmation code wrongly four times
  When user enters the code wrongly a fifth time
  Then user is blocked for 1 hour
  * user sees message "Resend wil be available after 1 hour"

  Scenario: User sees Start page upon app initialisation
  Given the user opens the DriveUp app for the first time
  * user has passed the loading screen
  When the app initializes
  Then the user should see the Start page with the text "Enter Your Phone number"

  Scenario: User sees warning after entering the code wrongly once
  Given user is on the confirmation code page
  When user enters the code wrongly
  Then user sees a message, promting user to check phone number and warning that after 4 more failed attempts, user is blocked for 1 h

  Scenario: User with multiple profiles lands on last used profile home screen
  Given user with multiple roles has submitted a phone number
  * user has received a verification code per SMS
  * user is on the "Enter verification code" page
  When user enters code correctly
  * user clicks "Next"
  Then user lands on the home screen of the last opened profile
