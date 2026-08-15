Feature: Instructor can view list of all trainings in the driving school

Scenario: Instructor can view list of all trainings in the driving school

Given instructor is on the list of training
* instructor sees, per default, only own trainings
When instructor opens the filter popup
* instructor deactives "Show only my students" filter
* instructor submits the form
Then instructor sees full list of trainings in the driving school
* instructor can open any training
* instructor can edit all details of a training
But instructor can't edit pending payments registered by other instructors
