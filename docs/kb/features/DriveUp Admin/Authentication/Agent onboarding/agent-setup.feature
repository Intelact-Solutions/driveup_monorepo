Feature: Agent setup

  Scenario: Language selection not shown if country has one language
  
  Given user has not previously registered for the app
  * has entered phone number for a country with a single language (e.g. Germany)
  * user is on the sign up page
  When user selects profile type
  Then user does not see the language selection screen
  * user directly proceeds with the corresponding next page

  Scenario: Language selection shown for countries with multiple official languages
  
  Given user has not previously registered for the app
  * has entered phone number for a country with multiple languages (e.g. Switzerland)
  * user is on the sign up page
  When user selects profile type
  Then user sees the language selection screen
  * user can't skip the screen

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
  Then user proceeds to the next screen

  Scenario: User can complete onboarding by passing through all info pages
  
  Given user has entered personal data and is on the info page section of the onboarding process
  When user views each info page about the features of the app
  * user clicks the "Next" button on each info page
  Then user completes the onboarding process
  And user lands on the Home screen

  Scenario: User can enter name
  
  Given user is on the "Personal Data" page of the onboarding process
  When user enters a valid name in the name field
  Then name is displayed in the input field
  * user can proceed to the next step

  Scenario: User can navigate back and forth in the info pages
  
  Given user is on one of the info pages in the onboarding process
  When user is on the second info page
  Then user sees only "Next" button
  * user can not navigate back to the previous info page

  Scenario: User can remove uploaded profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has entered all mandatory data
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

  Scenario: User can select language
  
  Given user has not previously registered for the app
  * has entered phone number for a country with multiple languages (e.g. Switzerland)
  * user is on the sign up page
  When user selects profile type
  * user selects a language
  *  user clicks "Next"
  * user lands on the first page of the onboarding process

  Scenario: User can select user type Marketing Agent
  
  Given user is on the "Welcome" screen
  When user clicks on user type card "Marketing Agent"
  Then the user sees a loading screen while the account is being set up
  * user moves to the first screen of the driving school onboarding process

  Scenario: User can upload profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process
  When user clicks on the upload button
  * user selects an image in the local device
  * user crops and resizes image
  * user confirms the image upload
  Then image is uploaded succesfully
  * image is visible in the avatar

  Scenario: User can view sign up screen
  
  Given user has no account
  When user starts the app
  And user is authenticated
  Then user lands on the Sign up screen
  * user sees "Sign up" label and hint to select user type
  * user sees all available user types as selectable cards
