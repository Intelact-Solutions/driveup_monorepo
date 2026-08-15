Feature: Company name truncated if too long in Switch account screen

Scenario: Company name truncated if too long in Switch account screen

Given user has registered a long name for the company  
* user has multiple profiles 
When user clicks the profile icon on the Home page
Then switch account screen is shown 
* company name is displayed correcty for each instructor profile
