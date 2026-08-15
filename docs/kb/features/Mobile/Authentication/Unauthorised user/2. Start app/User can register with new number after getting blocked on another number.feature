Feature: User can register with new number after getting blocked on another number

Scenario: User can register with new number after getting blocked on another number

Given user is on the start page
* user is on the confirmation code page for a specific number 
When user enters the verification code wronlgy 5 times 
* user returns to the start page 
* user enters a new number 
Then user can proceed successfully
