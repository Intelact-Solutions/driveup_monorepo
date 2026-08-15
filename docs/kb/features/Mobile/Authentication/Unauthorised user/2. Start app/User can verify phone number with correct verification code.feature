Feature: User can verify phone number with correct verification code

Scenario: User can verify phone number with correct verification code

Given user with role <role> has submitted a phone number
  * user has received a verification code per SMS
  * user is on the "Enter verification code" page
  When user enters code correctly
  * user clicks "Next"
  Then user lands on <page>
  
  Examples:
  |role| page|
  |Instructor (active)| Instructor home screen|
  |Student (active)| Student home screen|
  |Agent (active)| Agent home screen|
  |Invited user without existing profile in another role| Onboarding first page|
  |Invited user with existing profile in another role| Home screen|
  |Unregistered user| Sign up page|
