Feature: Company working hours do not affect new added instructor working hours

Scenario: Company working hours do not affect new added instructor working hours

Given company has registered own working hours 
* instructor is already onboarded
When company changes working hours
Then instructor sees no change in his working hours
