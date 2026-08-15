Feature: Per default, a student can manage appointments in the training

Scenario: Per default, a student can manage appointments in the training

Given new training is added
* student is registered for the app
* student sees new training
When student uses the calendar of the training
Then student can add an appointment to an empty slot on the training calendar
* student can edit appointments
* instructor is notified about the changes
