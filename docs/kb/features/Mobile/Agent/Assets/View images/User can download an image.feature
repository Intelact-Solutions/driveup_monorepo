Feature: User can download an image

Scenario: User can download an image

Given user is logged in as sales agent
        * user has multiple image assets
        When user opens the Assets module
        And user clicks on the download button for an image
        Then the image is downloaded to the user's device
        * user sees a confirmation message "Image downloaded successfully"
