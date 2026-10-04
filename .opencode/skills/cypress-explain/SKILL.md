---
name: cypress-explain
description: Understands, reviews, and explains Cypress tests. Identifies intent, structure, mechanics, hidden dependencies, and quality issues in existing specs.
---

# Cypress Explain

Use this skill when auditing test suites, onboarding team members, investigating brittle tests, or reviewing test quality in the DriveUp monorepo.

## Review Approach

### 1. Classify the Question
- **Cypress concept question**: Explain the API, mechanics, best practices (e.g., "How does cy.intercept work?")
- **Specific test review**: Analyze a particular spec file for quality, correctness, maintainability

### 2. For Test Reviews, Analyze

#### Intent & Structure
- What user behavior does each test verify?
- Is the test title accurate and descriptive?
- Are tests organized logically (by feature, flow, component)?

#### Cypress Mechanics
- **Command chains**: Are commands properly chained? Is the subject handled correctly?
- **Assertions**: Are meaningful assertions present? Do they retry appropriately?
- **Network stubbing**: Is `cy.intercept()` used correctly with aliases and `cy.wait()`?
- **Aliases**: Are `@aliases` used properly for elements, routes, fixtures?

#### Hidden Dependencies & Flaky Patterns
- ⚠️ **Brittle selectors**: CSS classes, nth-child, complex paths, text that changes
- ⚠️ **Timing assumptions**: `cy.wait(ms)`, fixed delays, assuming animation completion
- ⚠️ **UI coupling**: Tests that navigate through UI instead of setting state programmatically
- ⚠️ **Missing assertions**: Actions without verification (click without assert)
- ⚠️ **Inter-test dependencies**: Tests that rely on previous test's state
- ⚠️ **Hardcoded data**: IDs, emails, values that may change between environments

#### Metadata Issues
- **Misleading test titles**: Title says "creates user" but test only verifies form validation
- **Incorrect comments**: Comments that describe different behavior than code
- **Outdated comments**: Comments referencing old API/implementation

#### Terminology Check
- Uses correct Cypress terms: "command chain", "subject", "assertion", "yield", "retry-ability"
- Not generic testing jargon: "step", "check", "verify" without Cypress context

## Output Format

Provide concise, practical feedback:

```
## Review: cypress/e2e/dashboard.cy.ts

### ✅ Strengths
- Uses data-cy selectors consistently
- Proper cy.intercept with aliases for API calls
- Tests are independent with cy.session for auth

### ⚠️ Issues Found
1. **Line 45**: `cy.wait(2000)` - arbitrary wait, replace with cy.intercept alias
2. **Line 62**: `cy.get('.btn-primary')` - brittle class selector, add data-cy
3. **Line 78**: Test "should load dashboard" only checks URL, no content assertions
4. **Line 90**: Comment says "verify notifications" but asserts on user menu

### 🔧 Recommendations
- Add data-cy attributes to app components for stable selectors
- Replace all cy.wait(ms) with network interception
- Add meaningful assertions after each user action
```

## DriveUp Monorepo Context

- **Review specs in**: `driveup-admin/cypress/e2e/**/*.cy.ts`, `driveup-portal/cypress/e2e/**/*.cy.ts`
- **Component tests**: `driveup-admin/cypress/component/**/*.cy.ts`, `driveup-portal/cypress/component/**/*.cy.ts`
- **Custom commands**: Check `cypress/support/commands.ts` for project-specific commands
- **Fixtures**: Check `cypress/fixtures/` for test data patterns