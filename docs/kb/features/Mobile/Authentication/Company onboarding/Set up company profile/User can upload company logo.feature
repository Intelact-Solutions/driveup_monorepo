Feature: User can upload company logo

Scenario: User can upload company logo

Given user is authenticated
* user has not completed onboarding
* user is on the company data page of the onboarding process
When user clicks on the upload button
* user selects an image in the local device
* user crops and resizes image
* user confirms the image upload
Then image is uploaded succesfully
* image is visible in the avatar
