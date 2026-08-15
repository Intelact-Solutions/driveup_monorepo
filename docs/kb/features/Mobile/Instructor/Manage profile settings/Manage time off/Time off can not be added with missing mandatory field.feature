Feature: Time off can not be added with missing mandatory field

Scenario: Time off can not be added with missing mandatory field

Given user is on the "Time off" page
When user fills out all fields except <field>
* user clicks the "Save" button 
Then the missing mandatory is highlighted red 
* user can not proceed 

Examples:
|field|
|title|
|start date|
|end date|
