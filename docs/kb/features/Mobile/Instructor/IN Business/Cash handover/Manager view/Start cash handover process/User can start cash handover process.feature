Feature: User can start cash handover process

Scenario: User can start cash handover process

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button        
        Then user sees list of instructors with pending payments and/or expenses
        * user sees details for every pending handover
        |sum|time&date|total payments|total expenses|recepient|
        * user can select instructor
        * user lands on the "Cash handover" page for the selected instructor
