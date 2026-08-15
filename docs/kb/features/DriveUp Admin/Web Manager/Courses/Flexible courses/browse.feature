Feature: Browse

  Scenario: On initial load, user sees courses with status Published and Draft
  
  Given user is logged in to driveUp Admin
  When user opens page "Fixed Courses"
  Then user sees list of fixed courses
  * user sees list of published and draft courses per default
  * user sees all status filters, where only "publish" and "draft" are selected
  * filter "ended" is not selected

  Scenario: User can filter list of courses by status
  
  Given user is on the list of fixed courses
  * user sees list of status filters
  When user selects only filter <status>
  Then only courses with status <status> are displayed
  * user can combine multiple filters
  
  Examples:
  |status|
  |published|
  |draft|
  |ended|

  Scenario: User can search list of courses
  
  Given user is on the list of courses
  When user enters a search item which matches with a string on 
  |course name|in-charge instructor|course part title|
  Then user sees list of search results

  Scenario: User sees list of courses
  
  Given user is logged in to driveUp Admin
  When user opens page "Flexible Courses"
  Then user sees list of flexible courses
  * each course is displayed as a card
  * for published courses, user sees following elements
  |course name|status|max. students|number of parts|
  * for published courses, user conditionally sees following elements
  |end date for a series|warning for parts which have no more appointments|
  * for Ended courses, user sees following elements
  |course name|status|max. students|number of parts|End Date|
  * for draft courses, user sees following elements
  |course name|status|max. students|number of parts|
