Feature: Instructor has no permission to edit payments registered by others

Scenario: Instructor has no permission to edit payments registered by others

Given instructor has opened a training detailed view 
* there are previous unapproved payments registered by other instructors for the training
When instructor goes to the "Payments" tab of a training
Then all payments registered by other instructor are read-only
* no action buttons are shown to the instructor
