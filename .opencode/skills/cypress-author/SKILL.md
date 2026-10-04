---
name: cypress-author
description: Creates, updates, and fixes Cypress end-to-end and component tests following best practices. Reads project config, custom commands, fixtures, and existing specs to match conventions.
---

# Cypress Author

Use this skill when writing new Cypress tests, fixing broken tests, or updating existing tests in the DriveUp monorepo (driveup-admin and driveup-portal Angular applications).

## Before Writing

1. **Read the project structure**: Check `driveup-admin/cypress.config.ts`, `driveup-portal/cypress.config.ts`, `package.json` files, support files (`cypress/support/`), existing specs (`cypress/e2e/`), custom commands, and fixtures.
2. **Match conventions**: Use the project's language (TypeScript), type patterns, helpers, custom commands, and fixtures.
3. **Detect Cypress version**: Limit suggestions to APIs available in the installed Cypress version.

## Selector Strategy

- **Honor `Cypress.ElementSelector`** configuration if present in cypress.config.ts
- **Prefer dedicated test attributes**: `data-cy`, `data-test`, `data-testid` over CSS classes and DOM structure
- **Suggest adding `data-cy`** to application code when no stable selector exists
- **Avoid brittle selectors**: nth-child, complex CSS paths, text-based selectors that change

## Test Stability

- **Never use arbitrary waits**: No `cy.wait(5000)`, `cy.wait(1000)`, etc.
- **Use `cy.intercept()` with aliases** for network requests: `cy.intercept('/api/**').as('apiCall')` then `cy.wait('@apiCall')`
- **Rely on automatic retries**: Assertions retry automatically; commands like `cy.get()`, `cy.contains()` retry
- **Tests must run independently**: Prepare application state programmatically (API calls, `cy.session()`, localStorage) rather than slow UI flows
- **No inter-test dependencies**: Each test sets up its own state

## Code Style

- **TypeScript**: Match the project's TypeScript patterns and strictness
- **Reuse existing**: Custom commands from `cypress/support/commands.ts`, fixtures from `cypress/fixtures/`, utilities from support files
- **Component tests**: Use `cy.mount()` with Angular TestBed configuration matching the project's setup
- **Naming**: Descriptive test names following `should [expected behavior] when [condition]` pattern

## Common Patterns

### Network Stubbing
```typescript
cy.intercept('GET', '/api/users*', { fixture: 'users.json' }).as('getUsers')
cy.wait('@getUsers')
```

### Authentication
```typescript
// Use cy.session for login caching
cy.session('admin-login', () => {
  cy.visit('/login')
  cy.get('[data-cy=email]').type('admin@driveup.com')
  cy.get('[data-cy=password]').type('password')
  cy.get('[data-cy=submit]').click()
  cy.url().should('include', '/dashboard')
})
```

### Component Testing (Angular)
```typescript
import { mount } from 'cypress/angular'
import { MyComponent } from './my.component'

cy.mount(MyComponent, {
  declarations: [...],
  imports: [...],
  providers: [...]
})
```

## What to Avoid

- ❌ `cy.wait(ms)` with hardcoded milliseconds
- ❌ `cy.get('.btn-primary')` - prefer `cy.get('[data-cy=submit-btn]')`
- ❌ Chaining too many commands without assertions
- ❌ Tests that depend on previous test's state
- ❌ `cy.contains('Submit')` when text can change - use data attributes
- ❌ `force: true` unless absolutely necessary (indicates timing/visibility issue)

## DriveUp Monorepo Context

- **Projects**: `driveup-admin` (admin panel), `driveup-portal` (customer portal)
- **Framework**: Angular with TypeScript
- **Test location**: `driveup-admin/cypress/e2e/`, `driveup-portal/cypress/e2e/`
- **Config**: `driveup-admin/cypress.config.ts`, `driveup-portal/cypress.config.ts`
- **Run commands**: `npx cypress run --project driveup-admin`, `npx cypress open --project driveup-portal`