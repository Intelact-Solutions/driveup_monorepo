Feature: Date and time of next driving session is updated upon change

Scenario: Date and time of next driving session is updated upon change

Given user has a training
* user has an upcoming appointment
* date and time of the upcoming appointment is shown
When user changes the date and/or time of the appointment
Then date and time on the History tab is updated
