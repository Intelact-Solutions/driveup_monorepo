Feature: Show list of topics

  Scenario: Topics for all categories are seeded on onboarding
  
  Given user is on the company onboarding process
  When user selects category B in the category selection page
  * user completes the onboarding
  * user goes to Topic settings
  Then all categories have seeded topics

  Scenario: User can sort topics by drag and drop
  
  Given user is logged in driveUp admin
  * user is on the list of topics for a category
  When user drag and drops a topic inside the list of topics
  Then the topic is positioned on the new position
  * in all training plans,the list is shown with the new order

  Scenario: User can view topic details
  
  Given user is logged in driveUp admin
  * user is on the list of topics for a category
  When user clicks on the topic card
  Then user sees detailed view of a topic
  * user sees topic image and name
  * user sees topic description
  * user sees list of skills related to the topic

  Scenario: User sees empty state if category has no topics
  
  Given user is logged in driveUp admin
  * user is on the list of categories
  When user clicks on a category without topics
  Then user sees the empty state view of the category
  * user sees "Add topics" button
  * user sees "Import plan from driveUp" button

  Scenario: User sees list of categories on Topic Settings page
  
  Given user is logged in driveUp admin
  When user opens the "Topic settings" page
  Then user sees list of driving categories
  * active and inactive categories are shown as separate groups
  * user sees details for each category
  |icon|name|badge|number of topics|

  Scenario: User sees list of topics for category
  
  Given user is logged in driveUp admin
  * user is on the "Topic settings" page
  When user clicks on a category
  Then user sees list of topics for the category
  * each topic features a topic image and a topic name
