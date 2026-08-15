Feature: Manage flexible course appointments

  Scenario: User can change the appointment for an uncompleted course part
  
  Given user is on the detailed view of a flexible course training for a student
  * user has uncompleted course parts with an upcoming appointment
  When user clicks on calendar icon
  * user selects another appointment
  Then newly selected appointment is shown at the bottom of the calendar
  * newly selected appointment is shown in the course part details after calendar submitted

  Scenario: User can select appointment for a flexible course part which has no appointment
  
  Given user is on the detailed view of a flexible course training for a student
  * user has uncompleted course parts without an appointment
  When user clicks on calendar icon
  Then user sees list of possible appointments for the current month
  * user can navigate between months
  * user can select an available appointment
  * selected appointment is shown at the bottom of the calendar
  * selected appointment is shown in the course part details after calendar submitted

  Scenario: User can unselect appointment for a flexible course part
  
  Given user is on the detailed view of a flexible course training for a student
  * user has uncompleted course parts with an upcoming appointment
  When user clicks on calendar icon
  * user unselects the appointment
  Then no appointment is shown at the bottom of the calendar
  * no appointment is shown in the course part details after calendar submitted
