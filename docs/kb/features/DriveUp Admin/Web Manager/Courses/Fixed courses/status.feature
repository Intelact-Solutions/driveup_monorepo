Feature: Status

  Scenario: User can navigate to detailed page of student course training
  
  Given user has a fixed course
  * the course is published
  * user is on the Course Status tab
  When user clicks on a specific course part
  * user clicks on the "See details" hyperlink for a student
  Then user is redirected to the training detailed page of the student

  Scenario: User can search for parts
  
  Given user has a fixed course
  * the course is published
  * user is on the Course Status tab
  When user enters a matching search string into the search field
  Then user sees course part in the list of search results

  Scenario: User can see details of a single part
  
  Given user has a fixed course
  * the course is published
  * user is on the Course Status tab
  When user clicks on a specific part
  Then user see assigned instructor for the part
  * user sees number and list of registered students
  * for each student, user sees status of the payment
  |paid|partially paid|unpaid|

  Scenario: User can see status of course parts
  
  Given user has a fixed course
  * the course is published
  When user goes to the Course Status tab
  Then user sees list of course parts
  * past parts are greyed-out
  * user sees status "Completed" for completed parts
  * user sees status "Cancelled" for cancelled parts
  * user sees no status for upcoming parts
