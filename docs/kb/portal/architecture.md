# DriveUp Portal Architecture

## Purpose

DriveUp Portal is the public-facing marketing website for DriveUp. It helps prospective customers, partners, and agents discover DriveUp's services and products, understand key value propositions, and get in touch with the DriveUp team (`README.md:3-5`). Unlike DriveUp Admin, the portal is **public** — there is no authentication, no role system, and no persistent backend state; it renders marketing content served by the DriveUp API and collects leads through contact forms.

It lives in the `driveup-portal` submodule (`docs/kb/projects/portal.md:7-11`) and is a separate git repository (`Intelact-Solutions/driveup-portal`, default branch `develop`).

## Tech stack

| Area                    | Choice                                                                                                            |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Framework               | Angular 21, standalone APIs, Angular CLI (`@angular/cli` `^21.1.3`)                                               |
| Language                | TypeScript `~5.9.2`, strict mode (`tsconfig.json:6`)                                                              |
| Rendering / serving     | Express 5 static server (`server.mjs`); README claims SSR (`@angular/ssr` + express) — see [Rendering note](#rendering--ssr-note) |
| Build / env             | `@ngx-env/builder` (`@ngx-env/builder:application`, `angular.json:26`)                                            |
| Styling                 | Tailwind CSS v4 (`tailwindcss`, `@tailwindcss/postcss`, `@tailwindcss/forms`, `@tailwindcss/aspect-ratio`) + `prettier-plugin-tailwindcss` |
| UI utilities            | Preline (JS initialized on route change), `@angular/cdk` dialog                                                       |
| Icons / SVG             | `@ngneat/svg-icon` + `@ngneat/svg-generator` (icons generated into `src/app/svg`, `.svgGeneratorrc.json:2-3`)      |
| Translations            | `@ngx-translate/core` + `@ngx-translate/http-loader`                                                              |
| Forms / validation      | Reactive forms + custom validator + reCAPTCHA v3 via `ngx-captcha` (`ReCaptchaV3Service`)                         |
| Notifications           | `ngx-toastr` with a custom `ToastMessageComponent`                                                                 |
| State / reactive        | RxJS `~7.8.0`, Angular Signals (`signal`, `computed`, `linkedSignal`, `rxResource`, `toSignal`)                    |
| Shared packages (npm)   | `@driveup/shared`, `@intelact/common` (`IResponse<T>`), `@intelact/driveup` (`IGeoInfo`, `PricePlan`)              |
| Tooling / quality       | ESLint (angular-eslint 21), Prettier, Vitest (`@ngx-env/builder:unit-test`), Husky + lint-staged, `reflect-metadata` polyfill |

## Application entry points

| Entry point       | Path                                    | Responsibility                                                                                                          |
| ----------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Browser bootstrap | `src/main.ts:5`                         | `bootstrapApplication(App, appConfig)` (no separate server bootstrap — see note below)                                  |
| Root config       | `src/app/app.config.ts:22-55`           | All environment providers: HTTP, router, translate, SVG icons, app config, toastr, app initializer                      |
| Root routes       | `src/app/app.routes.ts:4-194`           | Lazy-loaded, fully public routes; per-route SEO metadata (`data.meta = true`)                                           |
| Root component    | `src/app/app.ts:34-108`                 | `du-root` shell: header + `<router-outlet>` + deferred footer; menu data, language switching, SEO on navigation          |
| HTTP server       | `server.mjs:8-44`                       | Express static server: `/health`, static assets with immutable cache, SPA fallback to `index.html`                      |

All imports use TS path aliases (`tsconfig.json:17-24`): `@core/*`, `@layout/*`, `@pages/*`, `@shared/*`, `@svg/*`, `@app/*`.

## Rendering & SSR note

The README and project overview describe SSR (`@angular/ssr` + Express) as part of the stack (`README.md:53,61`; `docs/kb/projects/portal.md:16`). The **implemented code does not currently run Angular SSR**:

- `angular.json:33-34` sets `"server": false` and `"outputMode": "static"` — the build produces a static browser bundle only.
- `src/main.ts` calls the client-only `bootstrapApplication` and no server bootstrap / `provideServerRendering` exists.
- `@angular/ssr` is **not** in `package.json` dependencies; `express` (`^5.2.1`) is used by the hand-written `server.mjs`, which serves the static `index.html` for every route (`server.mjs:38-40`).

In other words: the portal is currently a static SPA hosted behind an Express 5 static server (DigitalOcean App Platform, `http_port: 3000`, `.do/app.yaml:59`). If a task mentions SSR, verify the actual build/server configuration first; the code does not match the README claim at the time of writing.

## Source layout

| Directory                  | Responsibility                                                                                                     |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `src/app/app.config.ts`    | Root provider wiring (`app.config.ts:22-55`)                                                                        |
| `src/app/app.routes.ts`    | All routes, lazy-loaded components, static SEO metadata (`app.routes.ts:4-194`)                                     |
| `src/app/app.ts`           | Root shell: header, footer, menu data, language + user-agent state, SEO on `NavigationEnd` (`app.ts:34-108`)        |
| `src/app/core/`            | Cross-cutting infrastructure: `data/` (menu + page content), `interceptors/`, `models/`, `providers/`, `services/`, `tokens/`, `temp-models.ts` |
| `src/app/layout/`          | Reusable chrome: `header/`, `footer/`, `page-section/` (barrel `layout/index.ts`)                                   |
| `src/app/pages/`           | Page-level components, one folder per route (`home`, `features`, `pricing`, `tutorials`, `contact-us`, `agents`, `faq`, legal pages, `not-found`) |
| `src/app/shared/`          | Reusable UI: `components/`, `models/`, `pipes/`, `utils/`, `validators/`                                            |
| `src/app/svg/`             | Generated SVG icon modules (`@ngneat/svg-generator`, `.svgGeneratorrc.json`)                                        |
| `public/i18n/`             | Locale JSON files: `de.json`, `en.json`, `fi.json`, `fr.json`, `it.json`                                            |
| `public/svg/`, `public/image/`, `public/team/` | Static assets (source SVGs, images, team portraits)                                          |
| `src/styles.css`           | Global Tailwind v4 theme (design tokens in `@theme`) and component utilities (`styles.css:3-170`)                   |

### `core/` sub-layout

| Folder           | Contents                                                                                                                     |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `core/data/`     | `header.data.ts`, `footer.data.ts`, `pages/` (home, faq, agents, contact-us, pricing content models)                         |
| `core/interceptors/` | Functional interceptors: `user-agent-headers`, `base-url`, `cache`                                                       |
| `core/models/`   | `AppRoutes` (`routes.model.ts`), `DuConfig` (`config.model.ts`), `RecaptchaActions` (`recaptcha-actions.model.ts`)           |
| `core/providers/`| `provideAppConfig` (`app-config.provider.ts`), `appInitializer` (`app-initializer.provider.ts`)                              |
| `core/services/` | `LanguageService`, `UserAgentService`, `DialogService`, `DataAccessService`, `ToastService`, `RecaptchaService`, `SEOService`, `Link` |
| `core/tokens/`   | `APP_CONFIG`, `IS_CACHEABLE`, `IS_EXTERNAL`                                                                                   |
| `core/temp-models.ts` | Temporary request-body models (`PricingRequest`, `ContactUsMessageRequest`, `ContactUsSalesRequest`)                      |

## Configuration & environments

Environment values are injected at build time by `@ngx-env/builder` and read through `import.meta.env` (`src/env.d.ts:2-10`):

| Variable                     | Used for                                        | Source                                                                        |
| ---------------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------- |
| `NG_APP_ENV`                 | App environment (`production/development/...`) | `app.config.ts:40`                                                            |
| `NG_APP_API_URL`             | API base URL (prepended by `baseUrlInterceptor`) | `app.config.ts:41`                                                          |
| `NG_APP_IMAGE_HOST_URL`      | Image host (defined; not currently referenced in code) | `app.config.ts:42`                                                   |
| `NG_APP_FALLBACK_LANGUAGE`   | Fallback language (default `en`)                | `app.config.ts:43`                                                            |
| `NG_APP_LANGUAGE_HEADER`     | HTTP header name for language (`x-language`)    | `app.config.ts:44`                                                            |
| `NG_APP_COUNTRY_CODE_HEADER` | HTTP header name for country (`x-country-code`) | `app.config.ts:45`                                                            |
| `NG_APP_SITE_KEY`            | reCAPTCHA v3 site key                           | `app.config.ts:46`                                                            |

Values are stored in `DuConfig` (`core/models/config.model.ts:3-11`) and provided under the `APP_CONFIG` injection token (`core/tokens/app-config.token.ts:4`) via `provideAppConfig` (`core/providers/app-config.provider.ts:6-8`). Production values are set in the DigitalOcean app spec (`.do/app.yaml:29-53`, API at `https://api.driveup.pro`). `.npmrc` holds an npm auth token; never commit or reproduce it.

The build/serve/test builders are the `@ngx-env/builder` equivalents (`angular.json:26,76,88`), so env is available at build time and in tests.

## Internationalization

i18n is **translation-key driven**:

- Content is never hard-coded in templates or page data; every label is a translation key string.
- Page content lives in `core/data/pages/*.data.ts` (e.g. `home.data.ts:1-83`), which store key paths such as `pages.home.heroSection.companyName`. Section components receive these typed data objects via `@Input` and render them with the `translate` pipe (e.g. `pages/home/hero-section/hero-section.component.ts:13-14`).
- Menu links are key-driven too: `HeaderMenuItems` (`core/data/header.data.ts:4-21`) and `FooterMenuItems` (`core/data/footer.data.ts:4-68`).
- Locale JSON lives in `public/i18n/` (`de`, `en`, `fi`, `fr`, `it`). `en.json` top-level namespaces: `footer`, `header`, `meta`, `pages` (agents, contactUs, faq, home, pricing), `shared`.
- The loader is `provideTranslateHttpLoader({ prefix: './i18n/', suffix: '.json' })` (`app.config.ts:27`).

`LanguageService` (`core/services/language.service.ts:11-96`) is the single integration point:

- Tracks the active language as a `toSignal` on `TranslateService.onLangChange` (`language.service.ts:19-21`).
- Persists the choice in `localStorage["du-pub-Lang"]` (`language.service.ts:16,84-88`).
- `initAppLang` registers supported languages, sets the fallback, and activates a language (`language.service.ts:25-31`).
- Language resolution happens at bootstrap in `appInitializer` (`core/providers/app-initializer.provider.ts:33-43,65-80`): stored language → browser language → geo-detected language (via `GET geoinfo`), intersected with the countries/languages the API reports as supported.
- Language-dependent assets (per-locale images/videos) are resolved with `getLanguageAsset` (`shared/utils/language-asset.util.ts:11-29`).

Switching language in the header reloads language-dependent resources and re-navigates the current route (`layout/header/header.component.ts:70-98`).

## State and data flow

There is no global store (no NgRx). Server content is cached in signals inside `DataAccessService` (`core/services/data-access.service.ts:17-27`) and consumed via `computed`/`rxResource` in page components:

| Endpoint (relative to `NG_APP_API_URL`) | Method | Service method (`data-access.service.ts`)                          |
| --------------------------------------- | ------ | ------------------------------------------------------------------ |
| `geoinfo`                               | GET    | `UserAgentService.initUserAgent` (`user-agent.service.ts:23-25`)   |
| `features`                              | GET    | `getFeatures` (`:29-35`) — also populates `featuresList` signal    |
| `price-plans`                           | GET    | `getPricePlans` (`:37-40`)                                         |
| `testimonials`                          | GET    | `getTestimonials` (`:42-48`)                                       |
| `faqs`                                  | GET    | `getFAQsList` (`:50-56`)                                           |
| `tutorials`                             | GET    | `getTutorials` (`:58-64`)                                          |
| `contact`                               | POST   | `postContactUsMessageRequest` (`:66-70`)                           |
| `contact/sales`                         | POST   | `postContactUsSalesRequest` (`:72-78`)                             |
| `contact/pricing`                       | POST   | `postPricingRequest` (`:80-84`)                                    |

The three POST endpoints first obtain a reCAPTCHA v3 token (`RecaptchaService.execute`, `core/services/recaptcha.service.ts:12-14`) and attach it as `recaptchaToken` in the body.

Read endpoints are marked `IS_CACHEABLE` (HTTP context, `core/tokens/is-cacheable.token.ts:3`), which the `cacheInterceptor` honors with an in-memory `Map` keyed by URL + language (`core/interceptors/cache.interceptor.ts:7-29`).

## Coding standards

- Standalone components only; no NgModules (`angular.json` schematics, `@angular/cli` conventions).
- `OnPush` change detection by default (`angular.json:14`).
- Prefer Signals for component state; server data via `rxResource`/`toSignal`; local state via `signal`/`computed`/`linkedSignal`.
- Use built-in control flow (`@if`, `@for`, `@switch`, `@defer`, `@let`) instead of legacy structural directives (`app.ts:27-31`, `home.component.html:3-42`).
- Avoid `ngClass`/`ngStyle`; use native `[class]`/`[style]` bindings and `class` strings on inputs (e.g. `header.component.ts:19-21`).
- Strict TypeScript: `strict: true`, `noImplicitOverride`, `noPropertyAccessFromIndexSignature`, `noImplicitReturns`, `noFallthroughCasesInSwitch`, and strict Angular template checks (`tsconfig.json:6-11,26-31`). Avoid `any`.
- `du` selector prefix enforced by ESLint (`eslint.config.js:13-20`); `consistent-type-imports` enforced (`eslint.config.js:21-27`).
- Components scoped to one feature folder; layout chrome in `layout/`; reusable UI in `shared/components/`.
- Prettier with `prettier-plugin-tailwindcss` and `tailwindStylesheet` pointing at `src/styles.css` (`.prettierrc:3-6`).
- Page sections are wrapped in `PageSectionComponent` (`layout/page-section/page-section.component.ts:3-11`) for consistent `side-padding` and `max-width`.
- The home page defers non-hero sections with `@defer (on viewport)` (`home.component.html:3-42`); the footer is deferred with `@defer (on viewport)` (`app.ts:27-31`).

## Knowledge-base maintenance

This document mirrors `driveup-portal/README.md` and the implemented code under `src/`. The portal has no Gherkin/`features/` coverage in this KB (those describe DriveUp Admin). When the portal's architecture, build mode (SSR vs static), routing, or i18n strategy changes, update this file and `docs/kb/projects/portal.md` together. Cross-reference the code map (`docs/kb/portal/code-map.md`) for file-level detail.
