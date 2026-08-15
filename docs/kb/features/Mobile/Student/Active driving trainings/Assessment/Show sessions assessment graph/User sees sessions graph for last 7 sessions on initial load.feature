Feature: User sees sessions graph for last 7 sessions on initial load

Scenario: User sees sessions graph for last 7 sessions on initial load

Given student has a training
* student has had more than 1 appointment
When student moves to "Assessment" tab of the training
Then student sees "Session Assessment" section
* student sees graphical view of the assessment of the last 7 sessions
* student sees a dot for each session
* student sees y-axis with score scala
* student sees x-axis with driving session numbers
* exams are not visualized on the x-axis
