Feature: Manage company language

  Scenario: Language page is not shown if multiple language are not supported for the country
  
  Given user is in a country with a single supported language (e.g. Germany)
  When user opens Company Settings
  Then user does not see the page "Languages"

  Scenario: Language page is shown if multiple language are supported for the country
  
  Given user is in a country with multiple supported languages (e.g. Switzerland)
  When user opens Company Settings
  Then user sees the page "Languages"

  Scenario: User can change the company language
  
  Given user is on the Languages page
  * user sees the selected language
  * user sees a list of other available languages
  When user selects another language
  Then the selected language is updated
  * app UI language is not changed
  * new users receive SMS invitation in the new language
  * reports are generated in the new language
  * lesson plan for new categories are imported in the new language
