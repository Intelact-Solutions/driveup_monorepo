Feature: User can remove student permission to manage appointments

Scenario: User can remove student permission to manage appointments

Given user is an instructor
* user has a driving training
* user is on the "Overview" page
When user unchecks the "Student can manage own appointments" toggler
Then student can't add appointment
* student can't edit appointmens
