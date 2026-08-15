Feature: Select user calendar

  Scenario: Calendar is editable
  
  Given user is manager
  * user is on the calendar default view
  When user expands the right vertical menu
  * and user selects another driving instructor
  Then user sees only the calendar of the selected instructor
  * user can view session details
  * user can edit session details
  * user can add new calendar item

  Scenario: Conflicting appointments are shown as overlapping calendar items
  
  Given user is logged in
  * user has multiple appointment in the same time
  When user opens the calendar module
  Then user sees overlapping appointments in the same slot

  Scenario: Current user is selected per default
  
  Given user is logged in
  * user opens the Calendar module
  Then current user sees own calendar
  * name of the current user is shown on the top right corner
  * current user is selected in the list of instructors

  Scenario: User can filter the calendar items
  
  Given user is on the calendar
  When user clicks on the top left menu
  * and user selects one or more filters
  Then the calendar is filtered according to the filter selection

  Scenario: User can search by speech-to-text
  
  Given user is on the default calendar view
  * user has given driveUp permission to access the microphone
  When user expands the right vertical menu
  * user clicks on the microphone icon
  * user pronounces a search string
  Then search string is added in the search field
  * list is filtered for instructors with matching names

  Scenario: User can search for instructor to view calendar
  
  Given user is on the default calendar view
  When user expands the right vertical menu
  * user enters matching string in the search field
  Then list is filtered for instructors with matching names

  Scenario: User can select a single instructor to view their calendar
  
  Given user is manager
  * user is on the calendar default view
  When user expands the right vertical menu
  * and user selects another driving instructor
  Then user sees only the calendar of the selected instructor
  * user can't select more than one instructor
  * name of the selected instructor is shown under "Selected instructor"
