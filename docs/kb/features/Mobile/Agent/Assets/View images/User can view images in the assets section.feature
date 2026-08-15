Feature: User can view images in the assets section

Scenario: User can view images in the assets section

Given user is logged in as sales agent
        * user has multiple image assets
        When user opens the Assets module
        Then user sees a section for images
        * first image is shown
        * user sees a slider to see the next images
