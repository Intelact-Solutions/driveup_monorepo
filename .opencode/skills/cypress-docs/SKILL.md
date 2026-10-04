---
name: cypress-docs
description: Looks up accurate, up-to-date Cypress documentation from docs.cypress.io. Searches official sources, uses LLM-optimized content via llms.txt, and stays version-aware.
---

# Cypress Docs

Use this skill to look up Cypress commands, APIs, configuration options, and verify behavior against official documentation. Grounds answers in docs, not training data.

## How It Works

1. **Searches official sources first**: Routes queries to correct section of docs.cypress.io (commands, guides, configuration, error messages)
2. **Uses LLM-optimized documentation**: Discovers structured Markdown via `/llms.txt` index for cleaner results
3. **Grounds in docs**: If claim can't be verified in official docs, says so rather than inventing API/behavior
4. **Version-aware**: Scopes answers to detected Cypress version in project, calls out differences

## Query Patterns

### Command API Lookup
```
/cypress-docs What is the full signature of cy.intercept() in Cypress 14?
/cypress-docs Show me all options for cy.intercept() with types and defaults
/cypress-docs How does cy.wait() work with aliases vs ms?
```

### Configuration
```
/cypress-docs What configuration options are available in cypress.config.ts?
/cypress-docs How to configure videoRecording in Cypress 13?
/cypress-docs What are the experimentalStudio options?
```

### Guides & Concepts
```
/cypress-docs How does retry-ability work in Cypress?
/cypress-docs Best practices for test isolation
/cypress-docs When to use cy.session() vs cy.request() for auth
```

### Error Messages
```
/cypress-docs What does "cypress detected that you returned a promise" mean?
/cypress-docs How to fix "element is not visible" errors?
```

### Version-Specific
```
/cypress-docs What's new in Cypress 14 for component testing?
/cypress-docs Does cy.prompt() exist in Cypress 13?
/cypress-docs Migration guide from Cypress 12 to 13
```

## Output Format

```
## Cypress Documentation: cy.intercept() Options (Cypress 14)

**Source**: https://docs.cypress.io/api/commands/intercept

### Signature
```typescript
cy.intercept(routeMatcher, routeHandler?)
cy.intercept(method, url, routeHandler?)
cy.intercept(routeMatcher, staticResponse)
```

### RouteMatcher Options
| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `method` | string | `'*'` | HTTP method (GET, POST, etc.) |
| `url` | string/RegExp | `'*'` | URL pattern to match |
| `hostname` | string | - | Hostname to match |
| `path` | string/RegExp | - | Path to match |
| `query` | object | - | Query params to match |
| `headers` | object | - | Headers to match |
| `times` | number | - | Number of times to match |

### RouteHandler Options
| Option | Type | Description |
|--------|------|-------------|
| `response` | object | Static response fixture |
| `middleware` | function | Function to modify request/response |
| `delay` | number | Delay response in ms |
| `forceNetworkError` | boolean | Simulate network error |

### Version Notes
- **Cypress 12+**: Full middleware support
- **Cypress 13+**: `times` option added
- **Cypress 14+**: Improved TypeScript types for response body

### Related
- [Network Requests Guide](https://docs.cypress.io/guides/network-requests)
- [cy.wait()](https://docs.cypress.io/api/commands/wait)
- [cy.request()](https://docs.cypress.io/api/commands/request)
```

## Key Behaviors

- **Verifies before answering**: Checks docs.cypress.io via llms.txt index
- **Cites sources**: Provides URLs to official documentation
- **Flags version differences**: Explicitly notes what's available in each version
- **Admits uncertainty**: "This isn't documented in official sources" rather than hallucinating

## DriveUp Monorepo Context

- **Detect version**: Reads `driveup-admin/package.json` and `driveup-portal/package.json` for Cypress version
- **Project config**: Checks `driveup-admin/cypress.config.ts`, `driveup-portal/cypress.config.ts`
- **Applies to both projects**: Documentation applies to both Angular applications

## Example Usage

```
/cypress-docs What are all the assertion methods available in Cypress 14?
/cypress-docs How to configure component testing for Angular in cypress.config.ts?
/cypress-docs Show me the Cypress.ElementSelector API for custom selector priority
/cypress-docs What's the difference between cy.request() and cy.intercept()?
```