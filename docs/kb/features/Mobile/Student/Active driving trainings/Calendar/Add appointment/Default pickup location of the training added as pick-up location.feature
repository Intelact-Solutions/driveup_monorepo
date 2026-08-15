Feature: Default pickup location of the training added as pick-up location

Scenario: Default pickup location of the training added as pick-up location

Given student is on the calendar
When student adds new appointment
Then default training pick-up location is added
