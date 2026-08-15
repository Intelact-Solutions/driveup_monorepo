Feature: Search list

  Scenario: User can enter search item through speech-to-text
  
  Given user is on driveUp admin
  * user has given permission to use microphone
  When user clicks on "Driving Trainings" in the menu
  * user clicks on the microphone icon in the search field
  * user speaks the name or phone number of a student
  Then user sees students list filtered according to the spoken search item

  Scenario: User can search for a training by student name or phone number
  
  Given user is on driveUp admin
  When user clicks on "Driving Trainings" in the menu
  * user enters name or phone number in the search field
  Then user sees students list filtered according to the entered search item
