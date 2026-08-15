Feature: User sees sessions graph for last 7 sessions on initial load

Scenario: User sees sessions graph for last 7 sessions on initial load

Given user has a training with a student
* student has had more than 1 appointment
When user moves to "Assessment" tab of the training
Then user sees "Session Assessment" section
* user sees graphical view of the assessment of the last 7 sessions
* user sees a dot for each session
* user sees y-axis with score scala
* user sees x-axis with driving session numbers
* exams are not visualized on the x-axis
