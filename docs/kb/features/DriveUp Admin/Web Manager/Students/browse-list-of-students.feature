Feature: Browse list of students

  Scenario: Default sorting of student list is by name in ascending order
  
  Given user is on driveUp admin
  When user clicks on "Students" in the menu
  Then user sees students list sorted by name in ascending order
  * user can switch to sort descending by clicking on "Name" in the header

  Scenario: User can change sorting of students list by clicking on header
  
  Given user is on driveUp admin
  * user is on the list of students
  * user is on default students list
  When user clicks on <sort_option> in the header
  Then user sees students list sorted by <sort_option> in ascending order
  * user can change direction of sorting by clicking on the same header again
  
  Examples:
  | sort_option    |
  | Balance        |
  | Total payments |

  Scenario: User can enter search item through speech-to-text
  
  Given user is on driveUp admin
  * user has given permission to use microphone
  When user clicks on "Students" in the menu
  * user clicks on the microphone icon in the search field
  * user speaks the name or phone number of a student
  Then user sees students list filtered according to the spoken search item

  Scenario: User can filter list of students by registration date range
  
  Given user is on driveUp admin
  * user is on the "Students" page
  When user clicks on "Filter" button
  * user selects a date in the "Registration time after" field
  * user selects a date in the "Registration time before" field
  * user saves the form
  Then user sees only students registered within the selected date range

  Scenario: User can filter list to show only active students
  
  Given user is on driveUp admin
  * user is on the "Students" page
  * list shows both active and inactive students
  When user clicks on "Filter" button
  * user checks "Only active students" toggler
  * user saves the form
  Then user sees only active students in the list

  Scenario: User can filter list to show only students with negative financial balance
  
  Given user is on driveUp admin
  * user is on the "Students" page
  * list shows both students with positive and negative financial balance
  When user clicks on "Filter" button
  * user checks "Only students with negative balance" toggler
  * user saves the form
  Then user sees only students with negative financial balance in the list

  Scenario: User can search for a student by name or phone number
  
  Given user is on driveUp admin
  When user clicks on "Students" in the menu
  * user enters name or phone number in the search field
  Then user sees students list filtered according to the entered search item

  Scenario: User can see list of active students
  
  Given user is on driveUp admin
  When user clicks on "Students" in the menu
  Then user sees list of students
  * toggler "Only active student" is checked by default
  * user sees student details
  |Student name|Profile picture|Phone number|Balance|Total payments|

  Scenario: User can uncheck toggler to view all students
  
  Given user is on driveUp admin
  When user clicks on "Students" in the menu
  * user unchecks "Only active student" toggler
  Then students list includes inactive students
