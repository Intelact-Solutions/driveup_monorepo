# Past driving or course session can be opened

- **Jira:** [DU-2150](https://intelact.atlassian.net/browse/DU-2150)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-721
- **Coverage:** 0/1 scenario(s) present in `features/`

> Past driving or course session can be opened

## Scenarios

- NOT in features/: Driving or course session in the past can be opened

## Description

Current implementation:
- A driving or course session can only be accessed through the Home section, but only as long as is it upcoming or in the current day.
- Session in the past can’t be accessed once calendar moves to next day
New implementation:
- driving and course sessions in the past are accessible through the calendar
- driving and sessions in the past can be edited

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
