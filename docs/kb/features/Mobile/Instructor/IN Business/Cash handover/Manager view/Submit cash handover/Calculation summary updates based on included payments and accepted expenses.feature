Feature: Calculation summary updates based on included payments and accepted expenses

Scenario: Calculation summary updates based on included payments and accepted expenses

Given user is manager
        * user is on the "Cash handover" page
        When manager changes the status of a payment or expense
        Then the cash handover calculation summary is updated accordingly
