Feature: User can correct wrong code and re-submit in the same session

Scenario: User can correct wrong code and re-submit in the same session

Given user is on the "Promotion Code" screen
* user has entered an invalid code
* the system has displayed an error message
  When user corrects the promotion code
  Then user sees an green succes message
  * promotion code is applied
