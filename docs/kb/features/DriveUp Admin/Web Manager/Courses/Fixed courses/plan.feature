Feature: Plan

  Scenario: Completed and Cancelled parts are not editable
  
  Given user is on the "Course Planning" tab
  * user has completed parts in a published course
  When user clicks on a completed part
  Then user sees details on the sidebar
  * course part and sidebar are greyed-out and not editable

  Scenario: Completed and Cancelled parts can't be deleted
  
  Given user has course parts which are completed
  When user opens "Course Planning" tab
  * user clicks on a completed part
  Then no delete icon is shown

  Scenario: Each subsequent course part is based on the data of the previous part
  
  Given user has one course part
  When user adds a second part
  Then the name "New Part" is automatically added
  * instructor of the previous part is automatically assigned
  * start time and duration of the previous part are automatically added
  * date is automatically set to the next working day after the previous part
  * all fields are editable

  Scenario: First added course part is pre-filled with default data for mandatory fields
  
  Given user has a fixed course
  * user is on the "Course planing" tab of the course detailed view
  * user has not added any part yet
  When user clicks "Add part"
  Then new part is added
  * placeholder "New Part" is added as part name
  * in-charge instructor of the course is pre-selected as default instructor" of the part
  * current date is pre-selected as course date
  * current time (rounded to the next 5 min interval) is pre-selected as start time
  * end time is set automatically at 60+ min from start time

  Scenario: User can add part to a published course
  
  Given user has a published course
  * user is on the "Course planing" tab
  When user adds a new part
  Then the part is added to the calendar of all participants
  * participants are notified about the change

  Scenario: User can delete upcoming course part
  
  Given user is on "Course Planning" tab
  * user has upcoming parts in a published course
  When user clicks on the delete icon for an upcoming part
  * user confirms the deletion
  Then part is deleted
  * all participants are notified about the removal

  Scenario: User can edit pre-filled course part data
  
  Given user has added a new course part
  * all part data is pre-filled with default values
  When user opens the course part details
  Then user can edit part name
  * user can edit start time
  * user can edit end time
  * user can select another instructor
  * user can edit date
  * all changes are automatically saved and visible in the list of parts

  Scenario: User can update upcoming course part
  
  Given user is on "Course Planning" tab
  * user has upcoming parts in a published course
  When user clicks on an upcoming part
  Then user can edit all attributes
  * all changes are saved and visible for the participants
  * all participants received a notification

  Scenario: User can view course plan
  
  Given user has a fixed course
  * user has added at least one part
  When user opens the "Course planing" tab of the course detailed view
  Then user sees all course parts
  * parts are ordered chronologically, with earliest on top
  * for every part, user sees the following elements
  |part number|part name|  part date| start time| end time| delete icon |

  Scenario: User sees placeholder if no part is added
  
  Given user has a draft fixed course
  * course has no parts
  When user clicks on the "Course Planing" tab
  Then user sees a placeholder message with the hint to add a new part
