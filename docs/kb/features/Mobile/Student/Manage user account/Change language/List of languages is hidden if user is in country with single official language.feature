Feature: List of languages is hidden if user is in country with single official language

Scenario: List of languages is hidden if user is in country with single official language

Given user is in a country with a single official language
When user opens the account settings page
Then user does not see the item "Languages" in the menu
