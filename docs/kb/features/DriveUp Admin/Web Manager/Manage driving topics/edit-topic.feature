Feature: Edit topic

  Scenario: Show info text regarding training plan update
  
  Given user is on the list of topics for a category
  When user clicks on a topic
  * user opens the detailed view of a topic
  Then user sees info message  â€œAny change you make to your topic will be reflected on the content of both upcoming and past driving sessionsâ€

  Scenario: User can add or remove skills inside a topic
  
  Given user is logged in to driveUp
  * user is on the list of topics for a category
  When user enters a text into the skill name
  * user clicks "Add"
  Then new skill is added to the topic
  * new skill is visible in the training plan of newly added trainings
  * new skill is visible in the training plan of ongoing trainings

  Scenario: User can change sorting of skills by drag and drop
  
  Given user is on the detailed view of a topic
  * user has multiple skills
  When user drag-and-drops a skill to a new position
  Then position of the skill is changed
  * skill is shown in this position in all existing trainings

  Scenario: User can change topic name
  
  Given user is on the list of topics for a category
  * user has at least one topic
  When user clicks on the topic
  * user edits topic name
  Then changes are saved
  * changes are visible in the training plan of newly added trainings
  * changes are visible in the training plan of ongoing trainings

  Scenario: User can change topic picture
  
  Given user is logged in to driveUp
  * user is on the detailed view of a topic
  When user clicks on the picture icon
  * and user uploads new picture
  Then old picture is replaced
  * new picture is visible in the training plan of newly added trainings
  * new picture is visible in the training plan of ongoing trainings

  Scenario: User can remove skill from topic
  
  Given user is logged in to driveUp
  * user is on the detailed view of a topic
  When user removes skill
  * user saves topic
  Then skill is removed from the list
  * skill is continued to be shown for past sessions of the category
  * skill is not shown for the new driving sessions of the category
