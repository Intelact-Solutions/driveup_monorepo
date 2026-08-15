Feature: User can select automatic transmission

Scenario: User can select automatic transmission

Given user is on the "Add new training" popup
* user has added all personal data
* user has selected category
When user enables "Automatic tranmission"
* user clicks "Add training"
Then new training is added
* label "Automatic tranmission" is shown for the training in the trainings list
