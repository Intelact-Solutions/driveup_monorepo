Feature: View Pdf files

  Scenario: User can download a PDF file
  
  Given user is logged in as sales agent
  * user has multiple PDF assets
  When user opens the Assets module
  And user clicks on the download button for a PDF file
  Then the PDF file is downloaded to the user's device
  * user sees a confirmation message "PDF downloaded successfully"
  * user can open the downloaded PDF file in the device

  Scenario: User can view PDF files in the assets section
  
  Given user is logged in as sales agent
  * user has multiple PDF assets
  When user opens the Assets module
  Then user sees a section for PDF files
  * PDF files are shown as a list
  * user can scroll through the list to see all PDF files
