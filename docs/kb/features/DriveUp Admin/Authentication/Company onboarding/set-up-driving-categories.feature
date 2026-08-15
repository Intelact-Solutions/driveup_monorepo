Feature: Set up driving categories

  Scenario: Administration fee is not mandatory
  
  Given user is on the "Select categories" screen
  * user has clicked toggler to activate a category
  When user enters session duration for a category
  * user enters a price
  * user leaves the administration fee field empty
  * user clicks on "Next"
  Then the category should be saved successfully

  Scenario: Duration can be selected in 5 min intervals
  
  Given user is on the sidebar for a category
  * default duration is set as 30 min
  When user moves the slider to the next point
  Then duration is set to 35 min
  * maximum length is 3 hours

  Scenario: Price is mandatory
  
  Given user is on the "Select categories" screen
  * and user has clicked toggler to activate a category
  When user leaves the price empty
  * user enters all other data
  * user clicks on "Next"
  Then system should display an error message for missing price

  Scenario: User can activate a category
  
  Given user is logged in to driveUp admin
  * user is on the "Select categories" page of the onboarding process
  When user clicks on the toggler
  * user enters price
  * user enters administration fee
  * user selects session duration
  * user saves the form
  Then new category is activated
  * the toggler is turned on
  * new training in this category can be added when onboarding complete

  Scenario: User can activate multiple categories
  
  Given user is on the "Select categories" screen
  And user has already activated a category
  When user clicks toggler on a category that is not selected
  * user enters a session duration
  * user enters a price
  * user optionally enters an administration fee
  * user clicks on "Next"
  Then the second category is also activated
  * the second category should appear with a checkmark on the "Select Categories" screen

  Scenario: User can deactivate a category
  
  Given user is logged in to driveUp admin
  * user is on the "Select categories" page of the onboarding process
  * user has previously activated a category
  When user clicks on the toggler
  Then the category is greyed-out
  * category details are hidden
  * no training in this category can be added after the onboarding

  Scenario: User can deactivate a previously activated category
  
  Given user is logged in to driveUp admin
  * user is on the "Select categories" page of the onboarding process
  * user has previously activated a category
  When user clicks on the toggler
  Then the category is greyed-out
  * category details are hidden
  * no training in this category can be added after the onboarding

  Scenario: User can edit category
  
  Given user is logged in to driveUp admin
  * user is on the "Select categories" page of the onboarding process
  * user has previously activated a category
  When user clicks on the edit button for the category
  Then sidebar is opened
  * user can edit category settings

  Scenario: User can select a new category by entering category data
  
  Given user is logged in to driveUp admin
  * user is on the "Select categories" page of the onboarding process
  When user clicks on the toggler
  * user enters price
  * user enters administration fee
  * user selects session duration
  * user saves the form
  Then new category is activated
  * the toggler is turned on
  * new training in this category can be added when onboarding complete
