Feature: Appointments are ordered chronologically, with earliest on top

Scenario: Appointments are ordered chronologically, with earliest on top

Given user is authenticated
        * user has upcoming driving sessions and course part appointments
        When user opens the Workday home page
        Then user sees driving sessions and course parts in the list
        * all list items are ordered chronologically, with earliest on top
        * Today and Upcoming appointments are separated in two sections
        * days in the upcoming section are visually separated from each other
