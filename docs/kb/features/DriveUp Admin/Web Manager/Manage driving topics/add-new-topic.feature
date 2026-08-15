Feature: Add new topic

  Scenario: Only name is mandatory for topic
  
  Given user is logged in to driveUp
  * user is on the list of topics for a category
  When user clicks "Add topic"
  Then the topic is automatically added with default name â€œNew Topicâ€œ
  * user can update the name 
  * user can add all other elements |picture|skill|
  * other elements are not mandatory

  Scenario: User can add new topic
  
  Given user is logged in to driveUp
  * user is on the list of topics for a category
  When user clicks "Add topic"
  Then new topic is added 
  * the topic form is opened
  * new topic is added to the list of topics
  * new topic is visible in the training plan of newly added trainings
  * new topics is visible in the training plan of ongoing trainings

  Scenario: User can import default driveUp learning plan
  
  Given user is on the list of topics for a category
  * no topics have been added yet
  When user clicks on the "Import plan from driveUp" button
  Then a default list of topics for the category is added
