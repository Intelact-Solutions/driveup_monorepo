Feature: User can edit student name, pic and phone number if student not onboarded

Scenario: User can edit student name, pic and phone number if student not onboarded

Given instructor has added a new training
* student has not finished the onboarding process for his driveUp account
When instructor opens training Overview
* instructor opens the 3-dot-menu
* instructor clicks "Edit student"
Then instructor can edit student name
* instructor can edit student picture
* instructor can edit student phone number
