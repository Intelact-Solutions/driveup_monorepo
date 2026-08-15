Feature: Delete topic

  Scenario: User can delete topic
  
  Given user is on the list of topics for a category
  * user has clicked on a category
  When user clicks the delete icon
  * user confirms deletion
  Then topic is removed from the lesson plan
  * topic is not available for newly added trainings
  * topic is removed from ongoing trainings
  * topic is not removed from completed trainings
  * topic is still visible in reports of past trainings
