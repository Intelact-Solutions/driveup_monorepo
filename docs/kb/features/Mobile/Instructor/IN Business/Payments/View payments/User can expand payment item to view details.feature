Feature: User can expand payment item to view details

Scenario: User can expand payment item to view details

Given user is an instructor
        * user has payments
        When user opens the full list of payments
        * user clicks on the "Show details" button of a payment item
        Then payment item is expanded
        * expanded view shows fields "Registered by" and "Description"
