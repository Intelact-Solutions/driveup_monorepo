Feature: Request course payment from student

  Scenario: Payment request button is disabled for students with zero or positive balance for course training
  
  Given user is on driveUp admin
  * student has zero or positive balance for the course training
  * user is on the detailed view of a course training
  When user looks at "Request Payment" button in the sidebar
  Then "Request Payment" button is disabled
  * user cannot click on "Request Payment" button

  Scenario: User can request payment from student with negative balance for a course training
  
  Given user is on driveUp admin
  * student has negative balance for the course training
  * user is on the detailed view of a course training
  When user clicks on "Request Payment" in the sidebar
  Then user sees confirmation dialog with balance information and message
  * user can confirm sending request
  * request is sent to student by SMS
