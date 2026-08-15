# Company Manage Fixed Courses

- **Jira:** [DU-34](https://intelact.atlassian.net/browse/DU-34)
- **Platform:** API
- **Component:** CORE_API_du
- **Status:** Review
- **Parent epic:** DU-29
- **Coverage:** N/A – prose/technical story without scenarios

> Company Manage Fixed Courses

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

End Points:
- List Courses (Start Date Descending)
- List Course Students
- Add Course
- Update Course Title
- Update Course Max Student Number
- Update Course Public Availability
- Update Course Price
- Update Course Location
- Update Course Description
- Publish Course
- Cancel Course
- Sort Parts
- Add Part
- Update Part
- Delete Part
Data Validation:
- Unique:
- N/A
- Mandatory:
- N/A
- Conditional Actions:
- Add/Update Part required data
- Part Title
- Part Instructor
- Part Date
- Part Start Time
- Part End Time (Must be greater than Start Time)
- Publish Course required data
- Course Title
- Maximum Student Number
- Price
- Location
- At Least 1 Part

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
