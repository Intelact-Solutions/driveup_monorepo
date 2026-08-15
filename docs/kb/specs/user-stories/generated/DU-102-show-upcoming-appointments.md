# Show upcoming appointments

- **Jira:** [DU-102](https://intelact.atlassian.net/browse/DU-102)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-101
- **Coverage:** 1/11 scenario(s) present in `features/`

> Show upcoming appointments

## Scenarios

- NOT in features/: User can see today and upcoming driving sessions
- Likely covered (rephrased): User can see course part appointments
- NOT in features/: Past appointments are not shown
- NOT in features/: Todays appointments are highlighted
- NOT in features/: Appointments are ordered chronologically, with earliest on top
- NOT in features/: User can see empty screen placeholder if no appointments exist for today
- NOT in features/: User does not see the upcoming section if no appointments exist
- NOT in features/: User can see empty screen placeholder if no appointments exist
- NOT in features/: User can open detailed view of todays session from the Workday Home list
- NOT in features/: User can open detailed view of upcoming driving sessions
- NOT in features/: User can't open detailed view of upcoming course sessions

## Description

|
|
|
|
|
|
CHANGE REQUIREMENT:
- Allow the user to open upcoming sessions
- Show an alert informing the user that this session is in the future and topics/course attendance are read only
- Topics/course attendance are read only and student signature is disabled
- If the list of upcoming appointments is limited, show hint at the end of the list to inform the user that future appointments can be managed in the calendar

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
