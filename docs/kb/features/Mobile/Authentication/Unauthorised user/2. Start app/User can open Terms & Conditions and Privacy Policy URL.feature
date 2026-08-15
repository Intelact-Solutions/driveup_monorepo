Feature: User can open Terms & Conditions and Privacy Policy URL

Scenario: User can open Terms & Conditions and Privacy Policy URL

Given the user is on the Start page of the DriveUp app
  When the user taps on the "Terms & Conditions" or the "Privacy Policy" link
  Then the app should open the documents in the corresponding page inside driveup.pro
  * user sees document content
