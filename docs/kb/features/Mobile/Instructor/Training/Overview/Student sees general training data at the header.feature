Feature: Student sees general training data at the header

Scenario: Student sees general training data at the header

Given user has a training
* user is in the list of training
When user clicks on a training
Then user sees general training data at the header
|Student profile picture|Student name|Driving category| Automatic tranmission symbol (if any) | Training balance |
