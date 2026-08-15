Feature: User sees warning after entering the code wrongly once

Scenario: User sees warning after entering the code wrongly once

Given user is on the confirmation code page
When user enters the code wrongly
Then user sees a message, promting user to check phone number and warning that after 4 more failed attempts, user is blocked for 1 hour
