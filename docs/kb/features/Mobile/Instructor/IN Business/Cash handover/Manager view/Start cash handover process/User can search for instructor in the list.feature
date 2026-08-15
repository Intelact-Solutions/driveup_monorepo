Feature: User can search for instructor in the list

Scenario: User can search for instructor in the list

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user types instructor name in the search bar
        Then user sees filtered list of instructors matching the search criteria
        * user can select instructor from the filtered list
        * user lands on the "Cash handover" page for the selected instructor
