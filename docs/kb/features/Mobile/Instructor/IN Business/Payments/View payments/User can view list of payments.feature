Feature: User can view list of payments

Scenario: User can view list of payments

Given user is an instructor
        * user has payments
        * user is on the "Business Overview" page
        When user clicks on the header of the "Payments" section
        Then user lands on the "Payments" page
        * user sees full list of payments registered by them
        * default sorting of the list is chronological, with newest on top
