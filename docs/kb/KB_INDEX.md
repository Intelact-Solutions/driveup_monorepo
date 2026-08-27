# Knowledge Base Index for Tester Agent

## Source Files (Read-Only)

| File | Description | Records | Format |
|------|-------------|---------|--------|
| `docs/kb/source/bugs_Driveup_Devops.xml` | JIRA bug export for "driveUp DevOps" project | ~995 bugs | JIRA RSS/XML |
| `docs/kb/source/zephyr.xml` | Zephyr test cases for DriveUp Admin (Web) | 200+ test cases | Zephyr XML |
| `docs/kb/source/zephyr_mobile.xml` | Zephyr test cases for DriveUp Mobile | TBD | Zephyr XML |

---

## Bug Database Structure (bugs_Driveup_Devops.xml)

Each `<item>` contains:
- `<title>` - `[DU-XXXX] Summary`
- `<link>` - JIRA URL
- `<project>` - Project key (DU)
- `<description>` - HTML-encoded description with Preconditions, Steps, Result, Expected
- `<key>` - Bug key (DU-XXXX)
- `<summary>` - Summary text
- `<type>` - Bug
- `<parent>` - Epic/parent issue
- `<priority>` - Highest/High/Medium/Low
- `<status>` - To Do/In Progress/Review/Done/Backlog
- `<resolution>` - Unresolved/Done
- `<assignee>` / `<reporter>` - Account IDs
- `<labels>` - e.g., API_bug, BLOCKER, APPROVED, RETEST_OK
- `<component>` - web-dU, mobile-dU, manager_dU, instructor_dU, student_dU, agent_dU
- `<version>` - Affected version
- `<customfields>` - Severity, Probability, Epic Link, Sprint, driveUp Module, Time in Status, etc.
- `<comments>` - Comment history
- `<attachments>` - Screenshots/files

### Key Components
| Component | Description |
|-----------|-------------|
| web-dU | DriveUp Admin (web portal) |
| mobile-dU | DriveUp Mobile app |
| manager_dU | Company manager features |
| instructor_dU | Instructor features |
| student_dU | Student features |
| agent_dU | Agent/partner features |

### Key Labels
| Label | Meaning |
|-------|---------|
| API_bug | Backend/API issue |
| BLOCKER | Blocks release/critical path |
| APPROVED | Ready for dev |
| RETEST_OK | Verified fixed |
| REGRESSION | Regression from previous fix |

---

## Test Case Structure (zephyr.xml)

### Folder Hierarchy (Key Areas)
```
DriveUp Admin/
├── Authentication/
│   ├── Agent onboarding/
│   ├── Company onboarding/
│   ├── Instructor onboarding/
│   └── Unauthorised user/
├── Web Agent/
│   ├── Assets/
│   ├── Clients/
│   ├── Dashboard/
│   └── Financial information/
├── Web Manager/
│   ├── Cash handover/
│   ├── Courses/
│   ├── Debts/
│   ├── Driving Trainings/
│   ├── Expenses/
│   ├── Finances Dashboard/
│   ├── Financial flow/
│   ├── Home: Dashboard/
│   ├── Invoices/
│   ├── Manage appointments/
│   ├── Manage category settings/
│   ├── Manage company settings/
│   ├── Manage driving topics/
│   ├── Manage profile settings/
│   ├── Manage team/
│   ├── Manage user account/
│   ├── Online transactions/
│   ├── Students/
│   └── View calendar/
```

### Test Case Fields
- `id` / `key` (DU-TXXXX)
- `folder` - Full path in hierarchy
- `issues` - Linked JIRA issues (DU-XXXX)
- `labels` - e.g., auth, web, automated, manager, instructor, student, mobile
- `name` - Test case title
- `testScript` - BDD format (Given/When/Then)

---

## Common Search Patterns

### Find Bugs by Component
```bash
# Web admin bugs
grep 'component>web-dU<' bugs_Driveup_Devops.xml

# Mobile bugs
grep 'component>mobile-dU<' bugs_Driveup_Devops.xml

# Manager-specific
grep 'component>manager_dU<' bugs_Driveup_Devops.xml
```

### Find Bugs by Keyword in Description
```bash
grep -i 'handover' bugs_Driveup_Devops.xml
grep -i 'onboarding' bugs_Driveup_Devops.xml
grep -i 'calendar' bugs_Driveup_Devops.xml
```

### Find Test Cases by Folder
```bash
grep 'Driving Trainings' zephyr.xml
grep 'Cash handover' zephyr.xml
grep 'Manage company settings' zephyr.xml
```

### Find Test Cases by Label
```bash
grep 'label>manager<' zephyr.xml
grep 'label>automated<' zephyr.xml
```

---

## Output Directories (Write Access)

| Directory | Purpose |
|-----------|---------|
| `docs/kb/bugs/` | New bug tickets created by agent |
| `docs/kb/test-cases/` | New test case proposals / mappings |

---

## Quick Reference: Recent High-Priority Bugs

| Key | Summary | Component | Status |
|-----|---------|-----------|--------|
| DU-2200 | Handling of topic seeding | manager_dU, web-dU | To Do |
| DU-2192 | Instructor with deactivated profile can't be invited again | manager_dU, mobile-dU | Review |
| DU-2191 | Completing training after exam deletes exam appointment | instructor_dU, mobile-dU | Done |
| DU-2190 | Status filter for archived trainings does not work | instructor_dU, mobile-dU | Backlog |
| DU-2189 | List of trainings can't be searched by student name | instructor_dU, mobile-dU | Done |
| DU-2188 | User can't move existing task to the past | instructor_dU, mobile-dU | Done |

---

## Usage Notes for Agent

1. **Always read source files directly** - Don't rely on memory; the XML files are the source of truth
2. **Use grep with context** - `grep -A 20 -B 5 'DU-2191' bugs_Driveup_Devops.xml` to get full bug details
3. **Parse HTML entities** - Descriptions use `<` `>` `&` - decode when presenting
4. **Cross-reference** - Check both bugs and test cases for complete picture
5. **Write new bugs to** `docs/kb/bugs/BUG-<number>-<slug>.md`
6. **Write test case mappings to** `docs/kb/test-cases/mapping-<bug-key>.md`