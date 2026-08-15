Feature: User is blocked for 1 hour if confirmation code entered wrongly 5 times

Scenario: User is blocked for 1 hour if confirmation code entered wrongly 5 times

Given user has received a verification code per SMS
* user has entered the confirmation code wrongly four times
When user enters the code wrongly a fifth time
Then user is blocked for 1 hour
* user sees message "Resend wil be available after 1 hour"
