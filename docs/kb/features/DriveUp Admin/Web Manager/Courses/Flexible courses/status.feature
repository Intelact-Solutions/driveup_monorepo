Feature: Status

  Scenario: User can filter list based on part name
  
  Given user has a flexible course
  * the course is published
  * user is on the Course Status tab
  When user selects a part name in the course parts filter
  Then user sees appointments belonging only to the selected course part

  Scenario: User can navigate between months
  
  Given user has a flexible course
  * the course is published
  When user goes to the Course Status tab
  * user clicks on the month chevrons
  Then user can navigate forward and backward between months

  Scenario: User can navigate to Course Planning tab
  
  Given user has a flexible course
  * the course is published
  * user is on the Course Status tab
  When user clicks on a specific course part
  * user clicks on the "Edit appointment" button
  Then user is redirected to the "Course Planning" tab
  * correct part is selected
  * calendar for the selected part is shown on the date of the clicked appointment

  Scenario: User can navigate to detailed page of student course training
  
  Given user has a flexible course
  * the course is published
  * user is on the Course Status tab
  When user clicks on a specific course part
  * user clicks on the "See details" hyperlink for a student
  Then user is redirected to the training detailed page of the student

  Scenario: User can see details of a single appointments
  
  Given user has a flexible course
  * the course is published
  * user is on the Course Status tab
  When user clicks on a specific appointment in the list
  Then user see assigned instructor for the appointments
  * user sees date and time of the appointment
  * user sees number and list of registered students
  * for each student, user sees status of the payment
  |paid|partially paid|unpaid|

  Scenario: User can see status of course parts
  
  Given user has a flexible course
  * the course is published
  When user goes to the Course Status tab
  Then user sees list of all appointments for all course parts in the current month
  * list is chronological
  * past appointments are greyed-out
  * user sees status "Completed" for completed appointments
  * cancelled appointments are not shown
  * user sees no status for upcoming appointments

  Scenario: User can select a month to view appointments
  
  Given user has a flexible course
  * the course is published
  When user goes to the Course Status tab
  * user clicks on the calendar icon
  * user selects month
  Then user sees all course appointments for the selected month
