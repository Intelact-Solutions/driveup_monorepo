Feature: User can reactivate student permission to add an appointment

Scenario: User can reactivate student permission to add an appointment

Given user is an instructor
* user has a driving training
* user has previously removed student permission to add an appointment
* user is on the "Overview" page
When user checks the "Student can manage own appointments" checkbox
Then student can add new appointments
* student can edit appointments
