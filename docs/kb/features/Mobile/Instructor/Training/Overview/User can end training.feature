Feature: User can end training

Scenario: User can end training

Given user has a driving training
When user opens the three dot meenu
* user clicks End Training
Then training is ended
* all upcoming appointments are cancelled
* student is notified that the training has ended
