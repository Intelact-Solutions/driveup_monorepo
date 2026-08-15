Feature: User can edit student name and image if student completed onboarding

Scenario: User can edit student name and image if student completed onboarding

Given instructor has added a new training
* student has completed onboarding process for his driveUp mobile account
When instructor opens training Overview
* instructor opens the 3-dot-menu
* instructor clicks "Edit student"
Then instructor can edit student name and image
* BUT instructor can't edit student phone number
