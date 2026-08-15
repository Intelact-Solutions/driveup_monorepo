Feature: User can't add an appointment when clicking on a busy slot of the instructor

Scenario: User can't add an appointment when clicking on a busy slot of the instructor

Given user has an active driving training 
* user is on "Calendar" page
When user click on a busy slot of the instructor 
Then a message with the text "This time slot is not available" is shown 
* "Add" form is not triggered
