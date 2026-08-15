Feature: View handover history

  Scenario: User sees handover history
  
  Given user is on the list of pending handovers
  When user clicks on an instructor
  Then user sees list of handover items
  * user sees "History" button on the header
  * clicking the button opens the handover history sidebar
  * user sees list of all completed handovers
  * user sees handover details
  |sum|date & time|payments|expenses|recepient name|
