# User Account Management

- **Jira:** [DU-1927](https://intelact.atlassian.net/browse/DU-1927)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Review
- **Parent epic:** DU-1917
- **Coverage:** N/A – prose/technical story without scenarios

> User Account Management

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

User, Student, Agent (One-to-One) relationship, the following use cases need to be changed:
Use Case |
Changes |
Onboarding
Create/Activate Student |
- User.student is empty create new student profile POST onboarding/student/profile
- User.student.status === AccountStatus.Pending PUT onboarding/student/complete
- User.student.status === AccountStatus.Closed PUT onboarding/student/activate
- Complete action requires no studentId
- Complete and Activate response is IToken, update app token and trigger user/init
- If action button contains label, then label should be controlled by User.student like “Create Student“ or “Activate Student“
|
Onboarding
Create/Activate Agent |
- User.agent is empty create new agent profile POST onboarding/agent/profile
- User.agent.status === AccountStatus.Pending PUT onboarding/agent/complete
- User.agent.status === AccountStatus.Closed PUT onboarding/agent/activate
- Complete action requires no agentId
- Complete and Activate response is IToken, update app token and trigger user/init
- If action button contains label, then label should be controlled by User.agent like “Create Agent“ or “Activate Agent“
|
Close profile
Agent or Student |
- Response type is changed to IToken
- After success close account, update token and trigger user/init
|
Swutch Profile |
- -{{ChangeProfileDto:}}for agent and student
{type: ProfileType; id: number}
id is optionally-
|

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
