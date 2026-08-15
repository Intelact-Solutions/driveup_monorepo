Feature: Manage company profile

  Scenario: Owner can close the driving school
  
  Given logged user is company owner
  * user is on the company profile settings page
  * user has no other profile
  * company has no active student trainings
  When user clicks on "Close Driving School"
  * user confirms the action
  * user enters confirmation code received per SMS
  Then company account is closed
  * user lands on the "Empty Account Page"
  * active instructors receive SMS notification that their profile in this company has been deleted by the driving school and that they need to contact the driving school for further information
  * agent with active income from the driving school sees in-app notification that the driving school account has been closed

  Scenario: Owner cannot close the driving school if company has active student trainings
  
  Given logged user is company owner
  * user is on the company profile settings page
  * company has active student trainings
  When user clicks on "Close Driving School"
  Then company account is not closed
  * user sees the following error message: "Your driving school has [X] in-progress student trainings. Please complete or terminate your in-progress student trainings before closing the driving school"

  Scenario: Owner retains other existing profiles after closing driving school
  
  Given logged user is the company owner
  * owner has at least one more profile
  When owner closes driving school account
  Then owner retains the other existing profile(s)

  Scenario: User can update company address
  
  Given user is on the company profile settings page
  When user enters a new address in the address field
  * user enters a new postcode in the postcode field
  * user selects a new location using the "Pick location" button
  * user saves the changes
  Then user sees the updated location in the profile

  Scenario: User can update company logo
  
  Given user is on the company profile settings page
  When user uploads a new logo file
  * user saves the changes
  Then user sees the updated logo displayed in the profile

  Scenario: User can update company name
  
  Given user is on the company profile settings page
  When user enters a new company name in the company name field
  * user saves the changes
  Then user sees the updated company name in the profile
  * company name is update in all its instances in the app

  Scenario: User can update contact information
  
  Given user is on the company profile settings page
  When user enters a new phone number in the contact information field
  * user enters a new email in the contact information field
  * user saves the changes
  Then user sees the updated phone number and email in the profile

  Scenario: User can update homepage URL
  
  Given user is on the company profile settings page
  When user enters a new homepage URL in the homepage field
  * user saves the changes
  Then user sees the updated homepage URL in the profile

  Scenario: User can update obligation period
  
  Given user is on the company profile settings page
  When user increases or decreases the obligation period using the plus or minus button
  * user saves the changes
  Then user sees the updated obligation period in the profile
  * any appointment cancelled by a student inside this period will be recorded as a debt in the system

  Scenario: User can view company profile settings
  
  Given user is on the company profile settings page
  When user views the company profile form
  Then user sees fields for company logo, name, obligation period, homepage, contact information, location, and "Close Driving School" button
