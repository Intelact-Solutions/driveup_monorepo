Feature: User can view PDF files in the assets section

Scenario: User can view PDF files in the assets section

Given user is logged in as sales agent
    * user has multiple PDF assets
    When user opens the Assets module
    Then user sees a section for PDF files
    * PDF files are shown as a list
    * user can scroll through the list to see all PDF files
