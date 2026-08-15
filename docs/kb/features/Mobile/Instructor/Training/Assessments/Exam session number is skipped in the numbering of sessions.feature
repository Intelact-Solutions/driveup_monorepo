Feature: Exam session number is skipped in the numbering of sessions

Scenario: Exam session number is skipped in the numbering of sessions

Given user has a training with a student
* student has had 3 driving appointments
* student has had 1 exam session
* student has had 2 driving appointments after the exam sessions
When user goes to the "Assessment" tab
Then user sees 5 dots for the driving appointments
* user sees no dot for the exam appointment
* the fourth dot shows session number 5
