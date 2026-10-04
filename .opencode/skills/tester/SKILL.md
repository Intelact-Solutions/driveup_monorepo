---
name: tester
description: QA Test Manager for DriveUp monorepo. Manages test cases from Gherkin specs, maps coverage across platforms (Cypress, Maestro, API), creates bug tickets using JIRA/Zephyr templates, tracks regressions and flakes.
---

# Tester - QA Test Management

Use this skill for test planning, bug reporting, coverage analysis, regression tracking, and test data management across all DriveUp platforms.

## DriveUp Test Infrastructure

| Platform | Test Framework | Test Location | Config |
|----------|----------------|---------------|--------|
| **driveup-admin** | Cypress (E2E + Component) | `driveup-admin/cypress/e2e/`, `driveup-admin/cypress/component/` | `driveup-admin/cypress.config.ts` |
| **driveup-portal** | Cypress (E2E + Component) | `driveup-portal/cypress/e2e/`, `driveup-portal/cypress/component/` | `driveup-portal/cypress.config.ts` |
| **driveup-mobile** | Maestro (E2E) | `driveup-mobile/.maestro/**/*.yaml` | `driveup-mobile/.maestro/` |
| **driveup-api** | Jest (Unit/Integration) | `driveup-api/src/**/*.spec.ts` | `driveup-api/jest.config.ts` |
| **Specs (Admin)** | Gherkin | `gnosa/features/**/*.feature` | - |
| **Specs (Mobile)** | Gherkin | `docs/kb/features/**/*.feature` | - |

---

## Test Case Mapping (Gherkin → Implementation)

### Source of Truth: Gherkin Specs
Each `Scenario:` in `.feature` files = 1 test case minimum.

**Mapping Process**:
1. **Parse all scenarios** from `gnosa/features/` (admin) and `docs/kb/features/` (mobile)
2. **Generate coverage matrix** linking each scenario to:
   - Cypress test file + test name (admin/portal)
   - Maestro flow file (mobile)
   - API test file (backend)
   - JIRA test case ID (Zephyr)
3. **Identify gaps**: Scenarios with no test implementation

### Coverage Matrix Template

```
## Test Coverage Matrix: Admin Sign-In

| Gherkin Scenario | Admin (Cypress) | Portal | Mobile (Maestro) | API (Jest) | JIRA Test Case | Status |
|------------------|-----------------|--------|------------------|------------|----------------|--------|
| Request OTP for authorized admin | auth/signin.cy.ts: "should request OTP" | N/A | auth/sign_in.yaml | auth.controller.spec.ts | TC-1001 | ✅ Covered |
| No account enumeration | auth/signin.cy.ts: "should not reveal account existence" | N/A | ❌ Missing | auth.controller.spec.ts | TC-1002 | ⚠️ Gap: Mobile |
| Email format validation | auth/signin.cy.ts: "should reject invalid email" | N/A | auth/validation.yaml | auth.controller.spec.ts | TC-1003 | ✅ Covered |
| Invalidate previous OTP | auth/signin.cy.ts: "should invalidate previous OTP" | N/A | ❌ Missing | auth.controller.spec.ts | TC-1004 | ⚠️ Gap: Mobile |
| Email rate limit (5/15min) | auth/signin.cy.ts: "should block after 5 requests" | N/A | ❌ Missing | auth.controller.spec.ts | TC-1005 | ⚠️ Gap: Mobile |
| IP rate limit (5/15min) | auth/signin.cy.ts: "should block IP after 5 requests" | N/A | ❌ Missing | auth.controller.spec.ts | TC-1006 | ⚠️ Gap: Mobile |
```

---

## Bug Ticket Creation

### JIRA/Zephyr Template (from local exports + current JIRA)

**Local exports location**: Check `docs/qa/exports/` or ask for path
**Current JIRA**: Use as template for field structure, required fields, workflow

### Bug Report Structure

```markdown
## Bug Report: [Short Title]

**JIRA Template**: Based on [DU-XXXX](https://jira.intelact.com/browse/DU-XXXX)

### Environment
- **Platform**: [Admin / Portal / Mobile / API / Multiple]
- **Build/Version**: [e.g., admin@2.4.1, mobile@3.2.0]
- **Environment**: [local / dev / staging / prod]
- **Device/Browser**: [Chrome 128 / iOS 18 / Android 14 / Flutter 3.24]
- **Test User**: [test-student@driveup.com / Company: TestDrivingSchool]

### Reproduction Steps
1. [Step 1 - exact action]
2. [Step 2 - exact action]
3. [Step 3 - exact action]

**Gherkin Reference**: `gnosa/features/admin/sign_in.feature:13` (Scenario: Request an OTP for an authorized administrator)

### Expected Behavior
[What the spec says should happen - quote Gherkin Then/And steps]

### Actual Behavior
[What actually happens - include error messages, screenshots, logs]

### Evidence
- **Cypress/Maestro Run**: [Link to Cloud run or local artifact]
- **Screenshots**: [Attach or reference]
- **Logs**: [Console, Network, Test Replay timeline]
- **API Response**: [Request/Response payloads]

### Root Cause Analysis (if known)
[Code location, missing validation, race condition, etc.]

### Severity/Priority
- **Severity**: [Critical / High / Medium / Low] - based on user impact
- **Priority**: [P0 / P1 / P2 / P3] - based on business urgency

### Related
- **Blocks**: [Other tickets]
- **Duplicates**: [Existing tickets]
- **Regression**: [Yes/No - if yes, since which version/build]

### Test Case Update
- [ ] Add regression test to prevent recurrence
- [ ] Update coverage matrix
- [ ] Link to JIRA test case TC-XXXX
```

### Creating Bug Tickets

```bash
# 1. Find similar bugs in local JIRA export
grep -r "OTP\|rate.limit" docs/qa/exports/jira-*.json

# 2. Check current JIRA for field requirements
# (Use JIRA CLI or web UI to inspect required fields, custom fields)

# 3. Create bug with all required fields
# Use `/cypress-cloud-cli` if failure recorded in Cypress Cloud
# Use `/maestro` artifacts if mobile failure
```

---

## Regression & Flake Tracking

### Flake Detection
```bash
# Cypress: Check Cloud or local runs for retries
npx cypress cloud test attempts --test-id "xxx"  # if Cloud
# Local: Parse cypress run JSON output for "attempts" > 1

# Maestro: Check CI logs for retries
grep -r "retry\|flake" .github/workflows/ logs/
```

### Flake Report Template
```
## Flake Analysis: [Test Name]

**Test**: `cypress/e2e/auth/signin.cy.ts` - "should request OTP"
**Platform**: Admin (Cypress)
**Frequency**: 3/20 runs (15%) in last 30 days
**Pattern**: Fails on `cy.wait('@otpRequest')` - timeout
**Root Cause Hypothesis**: Test email fixture conflicts with parallel runs
**Evidence**: 
- Network shows 429 when parallel test uses same email
- Passes in isolation
**Fix**: Use unique test emails per parallel worker (`test-${workerId}@driveup.com`)
```

---

## Test Data Management

### Test User Provisioning
```bash
# API: Seed test users via script
driveup-api/scripts/seed-test-users.ts

# Admin/Portal: Use cy.session with API calls
cy.task('db:seed', { users: [...] })

# Mobile: Use Maestro `runScript` or API calls in flow setup
- runScript: "driveup-mobile/scripts/seed_test_users.dart"
```

### Fixtures Organization
```
cypress/fixtures/
├── users/
│   ├── admin-authorized.json
│   ├── admin-unauthorized.json
│   ├── instructor.json
│   └── student.json
├── courses/
│   ├── flexible-course.json
│   └── fixed-course.json
└── api-responses/
    ├── login-success.json
    └── otp-sent.json
```

---

## Commands Reference

```bash
# Generate coverage matrix from Gherkin
find gnosa/features docs/kb/features -name "*.feature" -exec grep -l "Scenario:" {} \; | \
  xargs -I {} sh -c 'echo "=== {} ==="; grep -A 2 "Scenario:" {}'

# Find Cypress tests for a feature
grep -r "sign.in\|otp" driveup-admin/cypress/e2e/ --include="*.cy.ts" -l

# Find Maestro flows for a feature
find driveup-mobile/.maestro -name "*.yaml" -exec grep -l "sign.in\|OTP" {} \;

# Find API tests
grep -r "AuthController\|otp" driveup-api/src/ --include="*.spec.ts" -l

# Check local JIRA export for bug patterns
jq '.issues[] | select(.fields.summary | test("OTP|rate.limit"; "i")) | {key: .key, summary: .fields.summary, status: .fields.status.name}' docs/qa/exports/jira-export.json

# Run full test suite with coverage
# Admin: npx cypress run --project driveup-admin --spec "cypress/e2e/auth/**"
# Mobile: maestro test driveup-mobile/.maestro/auth/
# API: cd driveup-api && npm run test:cov
```

---

## Integration with Other Skills

- Use `/cypress-author` to write missing Cypress tests for coverage gaps
- Use `/cypress-tap` to debug failing Cypress tests live
- Use `/maestro` to write/debug missing Maestro flows
- Use `/reviewer` to verify test implementation matches spec
- Use `/product-owner` to validate acceptance criteria coverage
- Use `/cypress-cloud-cli` to triage CI failures from Cloud