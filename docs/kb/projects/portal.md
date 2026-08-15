# DriveUp Portal

## Overview

**DriveUp Portal** is the public-facing marketing website for DriveUp. It helps prospective customers, partners, and agents discover DriveUp's services and products, understand key value propositions, and get in touch with the DriveUp team.

## Repository location

- Submodule: `driveup-portal/`
- Remote: `https://github.com/Intelact-Solutions/driveup-portal.git`
- Default branch: `develop`

## Knowledge base

Deep implementation references live in the `docs/kb/portal/` folder of this KB:

- [`../portal/architecture.md`](../portal/architecture.md) — stack, entry points, rendering/SSR note, source layout, config/environments, i18n, data flow, coding standards.
- [`../portal/code-map.md`](../portal/code-map.md) — page-by-page and service-level source map.

## Stack

- Framework: Angular 21 (standalone components), Angular CLI
- Rendering: SSR with `@angular/ssr` + Express (`server.mjs`)
- Language: TypeScript (strict)
- Styling: CSS with utility helpers (Tailwind tooling, `prettier-plugin-tailwindcss`)
- State/reactive: RxJS, Angular Signals where applicable
- Icons: `@ngneat/svg-icon` + `@ngneat/svg-generator` (run `pnpm svg` before start/build)
- Translations: `@ngx-translate/core`, `@ngx-translate/http-loader`
- Build/quality: ESLint (angular-eslint), Prettier, Vitest, Husky + lint-staged
- Shared packages: `@intelact/driveup`, `@intelact/common`

## Key features

- Marketing landing pages (home, pricing, learning hub, FAQs)
- Contact & lead capture with validation and spam protection (`ngx-captcha` + backend integration)
- Agent-focused content (how to become an agent, earning model)
- Internationalization-ready content driven by translation keys
- Responsive UX for desktop and mobile

## Project structure (simplified)

```
src/
  app/
    app.config.ts              # Root Angular app configuration
    app.routes.ts              # Application routes
    core/
      data/pages/              # Page content models & translation keys (home, agents, contact-us, faq, pricing, learning-hub)
      interceptors/            # HTTP interceptors (base URL, cache, headers)
      models/                  # Core models (routes, config)
      providers/               # App-wide providers
      services/                # Data access, language, toast, reCAPTCHA
      tokens/                  # Injection tokens
    layout/                    # header, footer, page-section
    pages/                     # Page-level components and templates
    shared/                    # components, models, pipes, utils, validators
```

## Coding standards

- Standalone components only (no new NgModules); `OnPush` change detection; built-in control flow (`@if`, `@for`, `@switch`).
- Prefer Angular Signals for component state where applicable.
- Avoid `any`; strict typing.
- Avoid `ngClass`/`ngStyle`; use native `[class]` and `[style]` bindings.

## Environment configuration

Environment variables are injected at build time via `@ngx-env/builder` and `.env` files (API base URLs, reCAPTCHA public key, etc.). Never commit secrets.
