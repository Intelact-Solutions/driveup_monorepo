Feature: User sees list of topics with corresponding assessment

Scenario: User sees list of topics with corresponding assessment

Given user is on the Assessment tab of a driving training
When user scrolls down to Topic Assessment
Then user sees list of topics
* for each topic, user sees the following elements
|topic title|score|graphical representation of average score|
