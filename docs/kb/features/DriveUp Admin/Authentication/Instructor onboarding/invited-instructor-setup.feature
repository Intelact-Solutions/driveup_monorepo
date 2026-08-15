Feature: Invited instructor setup

  Scenario: Instructor with manager role can use driveUp Admin
  
  Given user has been invited as instructor with manager role
  * user is authenticated with phone number and confirmation code
  When user completes the onboarding process
  Then user sees no blocker screen 
  * user lands on the Home screen of the driveUp admin

  Scenario: Instructor with no manager role can't use driveUp Admin
  
  Given user has been invited as instructor with NO manager role
  * user is authenticated with phone number and confirmation code
  When user completes the onboarding process
  Then user sees a blocker screen with an info message QR code to the mobile app stores
  * user has to download the mobile version in order to start work

  Scenario: Name is mandatory
  
  Given user is on the "Personal Data" page of the onboarding process
  When user leaves the name field empty
  * user attempts to proceed to the next step
  Then an error message appears saying "Name is mandatory"
  * user cannot proceed to the next step until the name is entered

  Scenario: Profile picture is not mandatory
  
  Given user is authenticated
  * user is on the first page of the onboarding process
  When user skips uploading the profile picture
  * user enters all other mandatory data
  Then user can proceed to the next screen

  Scenario: User can accept invitation
  
  Given user has received an invitation to join driveUp
  * user has no active profile
  * user has verified identity through phone number and verification code
  When user clicks "Accept"
  Then invitation screen is closed
  * user lands on the first page of the onboarding process

  Scenario: User can complete onboarding by passing through all info pages
  
  Given user has entered mandatory data and is on the info page section of the onboarding process
  When user views each info page about the features of the app
  * user clicks the "Next" button on each info page
  Then user completes the onboarding process
  * user lands on the Home screen

  Scenario: User can enter name
  
  Given user is on the "Personal Data" page of the onboarding process
  When user enters a valid name in the name field
  Then name is displayed in the input field
  * user can proceed to the next step

  Scenario: User can not navigate back and forth in the info pages
  
  Given user is on one of the info pages in the onboarding process
  When user is on the second info page
  Then user sees only "Next" button
  * user can not navigate back to the previous info page

  Scenario: User can open account settings from the web blocker screen
  
  Given user is a student or an instructor with no manager role
  When user logs in on the web
  * user lands on the blocker screen
  Then user can see user profile component
  * user can navigate to account settings

  Scenario: User can reject invitation
  
  Given user has received an invitation to join driveUp
  * user has no active profile
  * user has verified identity through phone number and verification code
  When user clicks "Reject"
  Then invitation screen is closed
  * user lands on the screen of the next invitation if any 
  * user lands on the start page after rejecting all invitations

  Scenario: User can remove uploaded profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has uploaded an image
  When user removes the image
  Then the avatar displays no image
  * user can proceed to the next screen

  Scenario: User can replace uploaded profile picture on the same screen
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has uploaded an image
  When user clicks on the upload button
  * repeats the upload process with a new image
  Then the image in the avatar is replaced

  Scenario: User can switch profile on the web blocker screen
  
  Given user is a student or an instructor with no manager role
  * user has multiple profiles
  When user logs in on the web
  * user lands on the blocker screen
  Then user can click on the profile picture
  * user can switch profile

  Scenario: User can upload profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process
  When user clicks on the upload button
  * user selects an image in the local device
  * user crops and resizes image
  * user confirms the image upload
  Then image is uploaded succesfully
  * image is visible in the avatar

  Scenario: User sees app in the language selected by the driving school
  
  Given user has received an invitation to join driveUp
  * user has no active profile
  When user starts the app
  * user is authenticated with phone number and confirmation code
  * user accepts the invitation
  Then user does not see the language selection
  * user language is set to company language

  Scenario: User sees invitation screen
  
  Given user has received an invitation to join driveUp
  * user has no active profile
  When user verifies identity through phone number and verification code
  Then user see the invitation screen
  * user sees "Accept" and "Reject" buttons
  * user can't skip the invitation screen
