Feature: User can filter based on appointment type

Scenario: User can filter based on appointment type

Given user has opened the calendar
* user has different types of appointments
|drving trainings|fixed courses|flexible courses|cancelled appointments|instructor tasks|
When user clicks on the top left menu
* user clicks on appointment type filter <type>
Then appointments are filted based on the selected appointment type

Examples:
|type|
|driving training|
|fixed courses|
|flexible courses|
|cancelled appointments|
|instructor tasks|
