Feature: Search list of course trainings

  Scenario: User can enter search item through speech-to-text
  
  Given user is on driveUp admin
  * user has given permission to use microphone
  When user clicks on "Course Trainings" in the menu
  * user clicks on the microphone icon in the search field
  * user speaks the course name or code
  Then user sees courses list filtered according to the spoken search item

  Scenario: User can search for a course training by course name or code
  
  Given user is on driveUp admin
  When user clicks on "Course Trainings" in the menu
  * user enters student name, phone number or course name in the search field
  Then user sees courses list filtered according to the entered search item
