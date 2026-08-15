Feature: User can submit cash handover

Scenario: User can submit cash handover

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        When user clicks on the "Submit" button
        Then the cash handover is submitted
        * user sees a confirmation message
        * all included payments and accepted expenses are removed from the "Cash handover" page
        * user is redirected to the "Business Overview" page
