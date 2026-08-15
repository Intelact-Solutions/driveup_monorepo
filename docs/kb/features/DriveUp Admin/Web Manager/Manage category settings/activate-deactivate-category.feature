Feature: Activate-deactivate category

  Scenario: Duration can be selected in 5 min intervals
  
  Given user is on the sidebar for a category
  * default duration is set as 30 min
  When user moves the slider to the next point
  Then duration is set to 35 min
  * maximum length is 3 hours

  Scenario: Seeding is possible when user activates category without topics
  
  Given user is logged in to driveUp admin
  * user has an inactive category which contains no topics
  When user clicks on the category to activate
  * user does not deactivate the "Import topics from driveUp" toggler, which is active per default
  * user activates the category
  Then default list of driveUp topics for the category is automatically seeded

  Scenario: Seeding not triggered when user activates category with topics
  
  Given user is logged in to driveUp admin
  * user has an inactive category which contains topics
  When user activates the category
  Then the automated topic seeding is not executed

  Scenario: Show alert for active category without topics
  
  Given user is logged in to driveUp admin
  * user has an active category without any topics
  When user opens the "Category settings" page
  Then user sees alert message that the corresponding category has no topics
  * user sees link to the topics management page

  Scenario: User can activate a category
  
  Given user is logged in to driveUp admin
  * user is on the "Category settings" page
  * user has an inactive category
  When user clicks on the toggler
  * user enters price
  * user enters administration fee
  * user selects session duration
  * user saves the form
  Then new category is activated
  * the toggler is turned on
  * new training in this category can be added

  Scenario: User can deactivate a category
  
  Given user is logged in to driveUp admin
  * user is on the "Category settings" page
  * user has an active category
  When user clicks on the toggler
  Then the category is greyed-out
  * category details are hidden
  * no new training in this category can be added
  * existing ongoing trainings in this category are not affected

  Scenario: User can skip seeding for category without topics
  
  Given user is logged in to driveUp admin
  * user has an inactive category which contains no topics
  When user clicks on the category to activate
  * user deactivates the "Import topics from driveUp" toggler
  * user activates topic
  Then the category is activated without any list of default topics
  * user sees alert message that the category has no topics
