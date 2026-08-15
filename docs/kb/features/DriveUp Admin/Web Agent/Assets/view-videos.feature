Feature: View videos

  Scenario: User can download a video
  
  Given user is logged in as sales agent
  * user has multiple video assets
  When user opens the Assets module
  And user clicks on the download button for a video
  Then the video is downloaded to the user's device
  * user sees a confirmation message "Video downloaded successfully"
  * user can open the downloaded video file in the device

  Scenario: User can view videos in the assets section
  
  Given user is logged in as sales agent
  * user has multiple video assets
  When user opens the Assets module
  Then user sees a section for videos
  * videos are shown as a list
  * user can scroll through the list to see all videos
