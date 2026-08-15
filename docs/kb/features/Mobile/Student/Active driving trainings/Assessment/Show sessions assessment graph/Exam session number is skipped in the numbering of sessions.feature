Feature: Exam session number is skipped in the numbering of sessions

Scenario: Exam session number is skipped in the numbering of sessions

Given student has a training
* student has had 3 driving appointments
* student has had 1 exam session
* student has had 2 driving appointments after the exam sessions
When student goes to the "Assessment" tab
Then student sees 5 dots for the driving appointments
* student sees no dot for the exam appointment
* the fourth dot shows session number 5
