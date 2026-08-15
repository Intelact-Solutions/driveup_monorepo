Feature: User can replace uploaded profile picture on the same screen

Scenario: User can replace uploaded profile picture on the same screen

Given user is authenticated
* user is on the first page of the onboarding process 
* user has uploaded an image
When user clicks on the upload button
* repeats the upload process with a new image
Then the image in the avatar is replaced
