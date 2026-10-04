---
name: cypress-cloud-cli
description: Triage recorded Cypress Cloud runs and failures using Cloud CLI. Pulls runs, specs, tests, failure screenshots, and Test Replay data from terminal.
---

# Cypress Cloud CLI

Use this skill to investigate CI failures and flakes recorded in Cypress Cloud. **Note: Requires Cypress Cloud subscription and configured Cloud CLI.**

## Prerequisites

- **Node.js**: 22.21.0 or later
- **@cypress/cloud** package installed
- **Authenticated CLI**: Run `npx cypress cloud login` 
- **Organization**: Cloud CLI integration enabled in Cypress Cloud settings
- **Recorded runs**: Tests must be recorded to Cloud with `--record` flag

## Commands Reference

### Setup & Auth
```bash
# Login to Cypress Cloud
npx cypress cloud login

# Verify authentication
npx cypress cloud whoami

# List organizations
npx cypress cloud org list
```

### Investigate from URL
```bash
# Diagnose a test failure directly from Cloud test URL
npx cypress cloud test diagnose "https://cloud.cypress.io/projects/xxx/runs/yyy/tests/zzz"

# Get test details from URL
npx cypress cloud test get "https://cloud.cypress.io/projects/xxx/runs/yyy/tests/zzz"
```

### Navigate Hierarchy
```bash
# List projects in organization
npx cypress cloud project list --org "my-org"

# List runs for a project
npx cypress cloud run list --project "driveup-admin"

# List specs in a run
npx cypress cloud spec list --run 1234

# List tests in a spec
npx cypress cloud test list --spec "login.cy.ts" --run 1234
```

### Test Replay Analysis
```bash
# Get failed attempt's Test Replay timeline
npx cypress cloud test replay --test-id "abc123" --attempt 2

# Get commands leading to failure
npx cypress cloud test replay-commands --test-id "abc123" --attempt 2

# Get network events (XHR/Fetch) at failure
npx cypress cloud test replay-network --test-id "abc123" --attempt 2

# Get console logs at failure
npx cypress cloud test replay-console --test-id "abc123" --attempt 2

# Get failure screenshot
npx cypress cloud test replay-screenshot --test-id "abc123" --attempt 2
```

### Flake Detection
```bash
# Get test attempt history
npx cypress cloud test attempts --test-id "abc123"

# Analyze flake pattern (failed attempt followed by passing)
npx cypress cloud test analyze-flake --test-id "abc123"
```

## Triage Workflow

### 1. Start from Cloud URL
```bash
# Copy test URL from Cypress Cloud UI or CI logs
# Example: https://cloud.cypress.io/projects/xyz/runs/42/tests/abc123

# Diagnose directly
npx cypress cloud test diagnose "https://cloud.cypress.io/projects/xyz/runs/42/tests/abc123"
```

### 2. Automatic Resolution
The skill will:
- Parse project, run number, and test ID from URL
- Query the specific test directly (no org/project traversal)
- Read attempt history to find the **failed attempt**
- Pass failed attempt number to all Test Replay queries

### 3. Evidence Collection
```bash
# Pull failure evidence
npx cypress cloud test replay-commands --test-id "abc123" --attempt 2
npx cypress cloud test replay-network --test-id "abc123" --attempt 2
npx cypress cloud test replay-console --test-id "abc123" --attempt 2
```

### 4. Root Cause Analysis
Correlate:
- **Commands**: What Cypress commands ran before failure
- **Network**: Failed API calls, unexpected responses, timing
- **Console**: Application errors, warnings, logs
- **Screenshot**: Visual state at failure moment

### 5. Flake vs Reproducible Failure
- **Flake indicators**: Failed attempt → passing retry, inconsistent timing
- **Reproducible**: Same failure every attempt, deterministic cause
- **Unknown**: Inconclusive evidence, cannot determine

## Output Format

```
## Cloud Failure Analysis

**Test**: Login flow - should redirect to dashboard after valid credentials
**Run**: #247 | **Spec**: auth/login.cy.ts | **Attempt**: 2 (failed) / 3 (passed)
**URL**: https://cloud.cypress.io/projects/xxx/runs/247/tests/abc123

### 🔴 Failure Evidence (Attempt 2)
**Error**: `Timed out retrying after 4000ms: Expected to find element: [data-cy=user-menu]`

**Commands Leading to Failure**:
1. cy.visit('/login') ✓
2. cy.get('[data-cy=email]').type('user@test.com') ✓
3. cy.get('[data-cy=password]').type('password') ✓
4. cy.get('[data-cy=submit]').click() ✓
5. cy.wait('@loginRequest') ✓ (200 OK)
6. cy.get('[data-cy=user-menu]') ✗ **FAILED**

**Network Events**:
- POST /api/auth/login → 200 OK (150ms)
- GET /api/user/profile → 401 Unauthorized ← **Root Cause**

**Console Logs**:
- ERROR: "Token refresh failed" (auth.interceptor.ts:45)

### 🟢 Passing Attempt (Attempt 3)
- Same commands, but GET /api/user/profile → 200 OK

### 📊 Flake Assessment
**Type**: Intermittent authentication race condition
**Cause**: Token not ready in localStorage when profile fetch fires
**Confidence**: High (network evidence correlates with failure)

### 🔧 Recommended Fix
Add `cy.wait('@profileRequest')` after login or ensure token is set before navigation
```

## DriveUp Monorepo Context

- **Projects**: `driveup-admin`, `driveup-portal` (separate Cloud projects)
- **Record command**: `npx cypress run --project driveup-admin --record --key <key>`
- **CI Integration**: GitHub Actions / GitLab CI with Cloud recording
- **Optional**: Since you don't use Cloud currently, this skill is available for future use

## Notes

- **Grounds conclusions in evidence**: Reports run, spec, test, timeline inspected
- **Names gaps**: When evidence incomplete, states what's missing rather than guessing
- **Version aware**: Works with Cloud CLI from `@cypress/cloud` package