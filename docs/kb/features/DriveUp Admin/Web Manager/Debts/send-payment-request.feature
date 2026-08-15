Feature: Send payment request

  Scenario: User can send a payment request for a student debt
  
  Given user is driveUp admin
  When user is on the list of student debts
  * user clicks on "Request payment" button
  * user confirms sending the payment request
  Then user sees a success message
  * an SMS with the payment request is sent to the student
  * a push notification is shown in the student app
