---
name: cypress-tap
description: Runs and debugs Cypress tests against a live cypress open session using cypress tap CLI. Reads Command Log, inspects DOM at failure point, and diagnoses failures.
---

# Cypress Tap

Use this skill when authoring or debugging tests against a live Cypress session. Requires Cypress 15.21.0+ and a running `cypress open` session.

## Prerequisites

- **Cypress version**: 15.21.0 or later (for `cypress tap` support)
- **Browser**: Chrome, Edge, or Firefox (supported by cypress tap)
- **Running session**: `cypress open` must be running for the target project

## Commands Reference

### Attach to Session
```bash
# List running sessions
npx cypress tap sessions

# Attach to project session (auto-detects)
npx cypress tap attach --project driveup-admin

# Attach to specific session by name
npx cypress tap attach --session "driveup-admin-chrome"
```

### Run Specs
```bash
# Run a single spec and poll for verdict
npx cypress tap run driveup-admin/cypress/e2e/login.cy.ts

# Run with custom timeout
npx cypress tap run driveup-admin/cypress/e2e/checkout.cy.ts --timeout 120000
```

### Read Results
```bash
# Get spec overview (passed/failed/pending)
npx cypress tap status

# Get Command Log for a specific test
npx cypress tap log --test "should login successfully"

# Get error details for failed test
npx cypress tap error --test "should login successfully"

# Get code frame for failing command
npx cypress tap code --test "should login successfully" --command 5
```

### Inspect Application at Failure
```bash
# Pin to a specific command's DOM snapshot
npx cypress tap pin --test "should login successfully" --command 8

# Read DOM at pinned command
npx cypress tap dom --max-nodes 500

# Read accessibility tree
npx cypress tap aria --max-nodes 300

# Inspect element properties
npx cypress tap inspect --selector "[data-cy=submit-btn]"

# Clear pin when done
npx cypress tap unpin
```

### Console & Network
```bash
# Get console output for a test
npx cypress tap console --test "should login successfully"

# Get network requests (XHR/Fetch)
npx cypress tap network --test "should login successfully"
```

## Debugging Workflow

### 1. Start Session
```bash
# Terminal 1: Start cypress open
npx cypress open --project driveup-admin
```

### 2. Attach & Run
```bash
# Terminal 2: Attach and run spec
npx cypress tap attach --project driveup-admin
npx cypress tap run driveup-admin/cypress/e2e/checkout.cy.ts
```

### 3. On Failure - Diagnose
```bash
# Wait for fresh verdict (polls status)
npx cypress tap status

# Read failing test's Command Log
npx cypress tap log --test "should complete checkout"

# Read error and code frame
npx cypress tap error --test "should complete checkout"
npx cypress tap code --test "should complete checkout" --command 12

# Pin at failing command and inspect app
npx cypress tap pin --test "should complete checkout" --command 12
npx cypress tap dom
npx cypress tap aria
npx cypress tap inspect --selector "[data-cy=payment-form]"

# Check console and network
npx cypress tap console --test "should complete checkout"
npx cypress tap network --test "should complete checkout"

# Clear pin
npx cypress tap unpin
```

## Key Behaviors

- **Reads results like Cypress app**: Spec overview → test Command Log → error + code frame → drill into single command
- **Inspects app at moment of failure**: Pins DOM snapshot, reads with dom/aria/inspect, clears pin
- **Keeps reads small**: Caps DOM/aria/console output, raises caps only when needed
- **Waits for real verdict**: Captures run start time, polls status until fresh passed/failed for that spec
- **Targets correct session**: When multiple `cypress open` sessions run, targets project session or named session

## DriveUp Monorepo Usage

```bash
# For driveup-admin
npx cypress open --project driveup-admin
npx cypress tap attach --project driveup-admin
npx cypress tap run driveup-admin/cypress/e2e/auth/login.cy.ts

# For driveup-portal
npx cypress open --project driveup-portal
npx cypress tap attach --project driveup-portal
npx cypress tap run driveup-portal/cypress/e2e/booking/flow.cy.ts
```

## Notes

- Use `cypress run` for headless CI execution (not cypress tap)
- `cypress tap` only works with `cypress open` sessions
- Session must be running the same project you're testing
- For component tests, ensure component testing is configured in cypress.config.ts