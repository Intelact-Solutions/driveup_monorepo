Feature: User can see past driving sessions

Scenario: User can see past driving sessions

Given user is logged in
* has an active driving training
* is on the detailed view of the driving training
When user opens the History tab
Then user sees details of each past driving session
* user sees session date and start time
* user sees name and picture of session instructor
* user sees list of topics
* user sees list of skills
* user sees the individual skill assessments
* user sees assessment average for the topic
* user sees number of times the topic has been repeated
* user sees topic status badge
