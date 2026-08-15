Feature: User can see past exam sessions

Scenario: User can see past exam sessions

Given user is logged in
* user has an active driving training
* user has had an exam session
* user is on the detailed view of the driving training
When user opens the History tab
* user goes to a exam session
Then user sees details of the exam session
* user sees session date and start time
* user sees name of examiner
* user sees status of exam as "Passed" or "Failed"
* user sees list of topics
* user sees passed or failed icon next to each topic
