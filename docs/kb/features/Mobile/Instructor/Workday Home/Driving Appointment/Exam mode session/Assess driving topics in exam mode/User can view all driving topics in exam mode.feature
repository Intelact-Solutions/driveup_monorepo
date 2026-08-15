Feature: User can view all driving topics in exam mode

Scenario: User can view all driving topics in exam mode

Given user is authenticated
    When user opens a session in exam mode
    Then list of all driving topics is displayed
    * for each topic in the list, user sees topic details
    |topic image|topic name|passed button|failed button|
