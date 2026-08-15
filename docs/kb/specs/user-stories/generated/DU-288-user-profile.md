# User Profile

- **Jira:** [DU-288](https://intelact.atlassian.net/browse/DU-288)
- **Platform:** API
- **Component:** API_du
- **Status:** Done
- **Parent epic:** —
- **Coverage:** N/A – prose/technical story without scenarios

> User Profile

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

- ProfileController: name (mandatory)
- ProfileController: image (optionally, validate type)
- Student image vs Profile image, if company has set image for the student, then show this image in training profile
- ProfileController: phone (mandatory, verify)
- ProfileController: language (mandatory, only country supported)
- ProfileController: email (optionally, no verification)
- ProfileController: address, location, zip (optionally)
- ProfileController: birthdate
- ProfileController: biometric data (optionally, validate, add and remove)
- ProfileController: switch profile
- ProfileController: Close Account
- Validate is any active profile

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
