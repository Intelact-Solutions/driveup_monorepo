Feature: User can replace uploaded company logo on the same screen

Scenario: User can replace uploaded company logo on the same screen

Given user is authenticated
* user has not completed onboarding
* user is on the first page of the onboarding process 
* user has uploaded an image
When user clicks on the upload button
* repeats the upload process with a new image
Then the image in the avatar is replaced
