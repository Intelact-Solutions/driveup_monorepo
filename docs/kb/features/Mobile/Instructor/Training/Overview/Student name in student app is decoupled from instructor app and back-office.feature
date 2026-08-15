Feature: Student name in student app is decoupled from instructor app and back-office

Scenario: Student name in student app is decoupled from instructor app and back-office

Given instructor has added a new training for a student named Max Mustermann
When student does onboarding process for his driveUp mobile account
* student adds name Felix Mustermann
Then student name in the instructor app is shown as Max Mustermann
* student name on back-office is shown as Max Mustermann
* student name on the student app is shown as Felix Mustermann
