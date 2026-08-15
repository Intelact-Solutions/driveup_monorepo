Feature: Set up company profile

  Scenario: Company logo is not mandatory
  
  Given user is authenticated
  * user has not completed onboarding
  * user is on the company data page of the onboarding process
  When user skips uploading the company logo
  * user enters all other mandatory data
  Then user can proceed to the next screen

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

  Scenario: Profile picture is not mandatory
  
  Given user is authenticated
  * user is on the first page of the onboarding process
  When user skips uploading the profile picture
  * user enters all other mandatory data
  Then user proceeds to the next screen

  Scenario: Skip name input on onboarding for a secondary profile
  
  Given user has an instructor profile
  * user is on the Account Settings page
  * user has received an invitation for a second profile with another role
  When user accepts the invitation
  Then user can select the new role
  * user does not sees the personal data page
  * user lands directly on the info pages for the new profile

  Scenario: User can enter name
  
  Given user is on the "Personal Data" page of the onboarding process
  When user enters a valid name in the name field
  Then name is displayed in the input field
  * user can proceed to the next step

  Scenario: User can not proceed without a selection
  
  Given user is authenticated
  * user is on the "Select services" page
  When user does not select any category
  Then Next button is disabled
  * user can't proceed with the onboarding

  Scenario: User can remove uploaded company logo
  
  Given user is authenticated
  * user has not completed onboarding
  * user is on the first page of the onboarding process 
  * user has entered all mandatory data
  When user removes the image
  Then the avatar displays no image
  * user can proceed to the next screen

  Scenario: User can remove uploaded profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has entered all mandatory data
  When user removes the image
  Then the avatar displays no image
  * user can proceed to the next screen

  Scenario: User can remove uploaded profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has entered all mandatory data
  When user removes the image
  Then the avatar displays no image
  * user can proceed to the next screen

  Scenario: User can replace uploaded company logo on the same screen
  
  Given user is authenticated
  * user has not completed onboarding
  * user is on the first page of the onboarding process 
  * user has uploaded an image
  When user clicks on the upload button
  * repeats the upload process with a new image
  Then the image in the avatar is replaced

  Scenario: User can replace uploaded profile picture on the same screen
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has uploaded an image
  When user clicks on the upload button
  * repeats the upload process with a new image
  Then the image in the avatar is replaced

  Scenario: User can replace uploaded profile picture on the same screen
  
  Given user is authenticated
  * user is on the first page of the onboarding process 
  * user has uploaded an image
  When user clicks on the upload button
  * repeats the upload process with a new image
  Then the image in the avatar is replaced

  Scenario: User can select both Driving Trainings and Theory Courses
  
  Given user is authenticated
  * user has selected onboarding as a driving school
  * user is on the "Select services" page
  When user selects "Driving trainings"
  * user selects "Theory Courses"
  * user clicks Next
  Then user sees category selection page on the onboarding process

  Scenario: User can select Driving Trainings
  
  Given user is authenticated
  * user has selected onboarding as a driving school
  * user is on the "Select services" page
  When user selects only "Driving trainings"
  * user clicks Next
  Then user sees category selection page on the onboarding process

  Scenario: User can select language
  
  Given user has not previously registered for the app
  * has entered phone number for a country with multiple languages (e.g. Switzerland)
  * user is on the sign up page
  When user selects profile type
  * user selects a language
  *  user clicks "Next"
  * user lands on the first page of the onboarding process

  Scenario: User can select Theory Courses
  
  Given user is authenticated
  * user has selected onboarding as a driving school
  * user is on the "Select services" page
  When user selects only "Theory services"
  * user clicks Next
  Then user skips the category selection page on the onboarding process

  Scenario: User can select user type driving school
  
  Given user is on the "Welcome" screen
  When user clicks on user type card "Driving School"
  Then the user sees a loading screen while the account is being set up
  * user moves to the first screen of the driving school onboarding process

  Scenario: User can submit company data
  
  Given user is on the "Enter company information" page
  When user enters company name
  Then user can proceed to the next page

  Scenario: User can upload company logo
  
  Given user is authenticated
  * user has not completed onboarding
  * user is on the company data page of the onboarding process
  When user clicks on the upload button
  * user selects an image in the local device
  * user crops and resizes image
  * user confirms the image upload
  Then image is uploaded succesfully
  * image is visible in the avatar

  Scenario: User can upload profile picture
  
  Given user is authenticated
  * user is on the first page of the onboarding process
  When user clicks on the upload button
  * user selects an image in the local device
  * user crops and resizes image
  * user confirms the image upload
  Then image is uploaded succesfully
  * image is visible in the avatar

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

  Scenario: User sees error message if mandatory data are missing
  
  Given user is on the "Enter company information" page
  When user enters company name
  Then user can proceed to the next page

  Scenario: User sees Select services page
  
  Given user is authenticated
  When user selects to do onboarding as a driving school
  * user clicks on Next
  Then user sees "Select services" page
  * user sees selection options
  |Driving Trainings| Theory Courses|
