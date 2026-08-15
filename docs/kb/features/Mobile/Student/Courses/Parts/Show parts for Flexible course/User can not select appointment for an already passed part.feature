Feature: User can not select appointment for an already passed part

Scenario: User can not select appointment for an already passed part

Given user has passed a specific part of the course successfully
* there are multiple appointments for that specific part 
When user goes to the list of course parts
Then user sees the "Present" badge for the specific part
* user does not see the calendar icon for the specific part
