Feature: User can upload profile picture

Scenario: User can upload profile picture

Given user is on the profile page
When user clicks on the upload button
* user selects an image in the local device
* user crops and resizes image
* user confirms the image upload
Then image is uploaded succesfully
* image is visible in the avatar
