# Add "Category" field to course edit form

- **Jira:** [DU-1926](https://intelact.atlassian.net/browse/DU-1926)
- **Platform:** 🌐 Web
- **Component:** manager_dU, web-dU
- **Status:** Test
- **Parent epic:** DU-547
- **Coverage:** 1/4 scenario(s) present in `features/`

> Add "Category" field to course edit form

## Scenarios

- NOT in features/: User can select category for a course
- Likely covered (rephrased): User can update category
- NOT in features/: Category dropdown shows all possible categories in a given country
- NOT in features/: User can't save course without category

## Description

Issue: With the new data model, course trainings have to be assigned to a specific driving category.
Solution: For both fixed and flexible courses, add the field “Category” to the edit form. The list contains the full list of possible categories in the given country, independent of which categories are currently active for the driving courses.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
