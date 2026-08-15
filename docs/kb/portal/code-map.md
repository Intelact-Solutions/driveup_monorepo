# DriveUp Portal Code Map

## Purpose

This is the source-code reference for the DriveUp public portal (`driveup-portal` submodule). It describes the implemented Angular application, not product requirements. The portal has no Gherkin coverage in this KB — `docs/kb/features/` describes DriveUp Admin — so treat this file as the behavioral reference for the portal. When the README or project overview disagrees with the code, flag the discrepancy (see [Known discrepancies](#known-discrepancies)).

## Architecture at a glance

- Angular 21 standalone-component, fully public SPA. All routes live in `src/app/app.routes.ts`; every route lazy-loads its page component.
- `src/app/core/` owns data models, HTTP, services, interceptors, tokens, providers, and page/menu content data.
- `src/app/layout/` owns the header, footer, and page-section chrome.
- `src/app/pages/` owns one folder per route; `src/app/shared/` owns reusable UI, models, pipes, utils, and validators.
- The build is static (`angular.json:33-34`, `"outputMode": "static"`, no `@angular/ssr`), served by a hand-written Express server (`server.mjs`). API base URL comes from `NG_APP_API_URL` through `APP_CONFIG`.
- Server content (features, price plans, testimonials, FAQs, tutorials) is fetched via `DataAccessService` (`src/app/core/services/data-access.service.ts`) and cached in signals; read endpoints opt in via the `IS_CACHEABLE` HTTP context token.
- All API responses are `IResponse<T>` from `@intelact/common`; shared domain types (`Content`, `Link`, `Language`, `PricePlanType`) come from `@driveup/shared`; `IGeoInfo` and `PricePlan` come from `@intelact/driveup`.

## Bootstrapping and root providers

- `src/main.ts:5` — `bootstrapApplication(App, appConfig)`; client-only bootstrap (no SSR bootstrap).
- `src/app/app.ts:34-108` — root `du-root` shell:
  - Loads features via `rxResource` and exposes the list for menus (`app.ts:45-49`).
  - Builds header/footer menu signals; footer "Features" children are filled from the features API with per-item routes via `AppRoutes.FEATURES.getFeatureItemRoute` (`app.ts:53-65`).
  - Language dropdown options derived from `UserAgentService.userAgentState().languages` (`app.ts:70-75`).
  - `effect` keeps `<html lang>` in sync with the active language (`app.ts:79-82`); scroll offset for the sticky header (`app.ts:85`).
  - Preloads FAQs and testimonials on startup (`app.ts:88-89`).
  - On `NavigationEnd`, updates SEO meta tags and re-inits Preline UI (`app.ts:92-99`).
- `src/app/app.config.ts:22-55` — root `ApplicationConfig` providers:

| Provider / concern                        | Reference                              |
| ----------------------------------------- | -------------------------------------- |
| Global error listeners                    | `app.config.ts:24`                     |
| `provideHttpClient` + fetch + interceptors | `app.config.ts:25`                     |
| Image size warning disabled               | `app.config.ts:26`                     |
| Translate loader (`./i18n/*.json`)        | `app.config.ts:27`                     |
| Router: component input binding, view transitions, in-memory scrolling | `app.config.ts:28-33` |
| `@ngneat/svg-icon` config + icon sets (socials, action, direction, mobile-os, hamburger, star) | `app.config.ts:34-38` |
| `provideAppConfig` from `import.meta.env` | `app.config.ts:39-47`                  |
| `ngx-toastr` with `ToastMessageComponent` | `app.config.ts:48-53`                  |
| `appInitializer`                          | `app.config.ts:54`                     |

Interceptor order: `userAgentHeadersInterceptor`, `baseUrlInterceptor`, `cacheInterceptor` (`app.config.ts:25`).

## Routes

All routes are public and lazy-loaded (`src/app/app.routes.ts:4-194`). Route path constants come from `AppRoutes` (`src/app/core/models/routes.model.ts:1-19`).

| URL                                   | Path constant          | Component (lazy)             | SEO metadata (`data`)            | Source                                       |
| ------------------------------------- | ---------------------- | ---------------------------- | -------------------------------- | -------------------------------------------- |
| `/`                                   | `AppRoutes.HOME`       | `HomeComponent`              | `pages.home.meta.*`              | `app.routes.ts:6-18`                          |
| `/features/:mainFeatureName/:featureItemName` | `FEATURES.*` | `FeaturesComponent` (3 configs) | dynamic (in-component `effect`) | `app.routes.ts:20-52`                    |
| `/pricing`                            | `AppRoutes.PRICING`    | `PricingComponent`           | `pages.pricing.meta.*`           | `app.routes.ts:54-66`                          |
| `/tutorials`                          | `AppRoutes.TUTORIALS`  | `TutorialsComponent`         | `pages.tutorials.meta.*`         | `app.routes.ts:68-80`                          |
| `/contact-us`                         | `AppRoutes.CONTACT_US` | `ContactUsComponent`         | `pages.contactUs.meta.*`         | `app.routes.ts:82-94`                          |
| `/agents`                             | `AppRoutes.AGENTS`     | `AgentsComponent`            | `pages.agents.meta.*`            | `app.routes.ts:96-108`                         |
| `/faq`                                | `AppRoutes.FAQ`        | `FaqComponent`               | `pages.faq.meta.*`               | `app.routes.ts:110-122`                        |
| `/legal/terms-and-conditions`         | `AppRoutes.TERMS_AND_CONDITIONS` | `TermsAndConditionsComponent` | `pages.termsAndConditions.meta.*` | `app.routes.ts:124-136`                  |
| `/legal/impressum`                    | `AppRoutes.IMPRESSUM`  | `ImpressumComponent`         | `pages.impressum.meta.*`         | `app.routes.ts:138-150`                        |
| `/legal/privacy-policy`               | `AppRoutes.PRIVACY_POLICY` | `PrivacyPolicyComponent`   | `pages.privacyPolicy.meta.*`     | `app.routes.ts:152-164`                        |
| `/legal/disclaimer`                   | `AppRoutes.DISCLAIMER` | `DisclaimerComponent`        | `pages.disclaimer.meta.*`        | `app.routes.ts:166-178`                        |
| `/404`                                | `AppRoutes.NOT_FOUND`  | `NotFoundComponent`          | `pages.notFound.meta.*`          | `app.routes.ts:180-192`                        |
| `**` (catch-all)                      | —                      | redirect to `/404`           | —                                | `app.routes.ts:193`                            |

Notes:

- `withComponentInputBinding()` (`app.config.ts:30`) binds URL params to component inputs — `FeaturesComponent.mainFeatureName` / `featureItemName` (`features.component.ts:22-23`).
- The `features` route registers three route shapes pointing at the same component (`app.routes.ts:20-52`): bare `/features`, `/features/:mainFeatureName`, and `/features/:mainFeatureName/:featureItemName`. Dynamic SEO is applied by an `effect` inside `FeaturesComponent` (`features.component.ts:52-67`).
- Legal pages render static prose from their HTML templates; no data files or services involved.

## Layout components

| Component                  | Selector     | Responsibility                                                                                        | Source                                          |
| -------------------------- | ------------ | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `HeaderComponent`          | `header`     | Sticky header with desktop + mobile nav, language switcher, "Enter the app" CTA (`app.driveup.pro`). Scroll listener flips `isFixed` past 300px (`header.component.ts:45-64`). Language change reloads features/FAQs/testimonials (plus tutorials/price-plans when on those pages) then re-navigates to the current route (`header.component.ts:70-98`) | `src/app/layout/header/header.component.ts:24-99` |
| `FooterComponent`          | `footer`     | Menu columns from `FooterMenuItems` + dynamic features children; renders current year into `footer.copyright` | `src/app/layout/footer/footer.component.ts:15-19` |
| `PageSectionComponent`     | `section`    | Thin wrapper providing consistent `side-padding mx-auto max-w-[1600px]` layout classes; used by pages via `<section>` | `src/app/layout/page-section/page-section.component.ts:3-11` |

Barrel: `src/app/layout/index.ts`.

## Page components

### Home

`HomeComponent` (`src/app/pages/home/home.component.ts:40-55`) orchestrates 8 section components, all fed by `HomePageData` signals plus server data:

| Section component                    | Data input                                    | Source                                             |
| ------------------------------------ | --------------------------------------------- | -------------------------------------------------- |
| `HeroSectionComponent`               | `heroSectionData`                             | `home/hero-section/hero-section.component.ts:13-14` |
| `MainFeaturesSectionComponent`       | `mainFeaturesSectionData`                     | `home/main-features-section/main-features-section.component.ts:13-14` |
| `AppsCarouselSectionComponent`       | `appsCarouselData`, `featuresList`            | `home/apps-carousel-section/apps-carousel-section.component.ts:16-18` |
| `AppsCarouselComponent`              | `featuresList`; `linkedSignal` selects feature, `gallery` slides, prev/next via `activeIndex` | `home/apps-carousel-section/apps-carousel/apps-carousel.component.ts:17-50` |
| `WorldMapSectionComponent`           | `worldMapSectionsData`                        | `home/world-map-section/world-map-section.component.ts:13-15` |
| `TestimonialsSectionComponent`       | `testimonialsSectionData`, `testimonials`     | `home/testimonials-section/testimonials-section.component.ts:16-18` |
| `TestimonialsCarouselComponent`      | `testimonials` → `TestimonialCardComponent`   | `home/testimonials-section/testimonials-carousel/testimonials-carousel.component.ts:17-18` |
| `FaqSectionComponent`                | `faqSectionData`, `faqList` (first 4 FAQs)     | `home/faq-section/faq-section.component.ts:20-24`   |
| `BecomeAgentSectionComponent`        | `becomeAgentData`; links to `/agents`         | `home/become-agent-section/become-agent-section.component.ts:15-19` |
| `CtaSectionComponent`                | `ctaSectionData`                              | `home/cta-section/cta-section.component.ts:13-16`    |

The template defers all non-hero sections with `@defer (on viewport)` and `@defer (when testimonials ...)` (`home.component.html:3-42`). Home reads server lists directly from `DataAccessService` signals (`home.component.ts:52-54`).

### Features

`FeaturesComponent` (`src/app/pages/features/features.component.ts:17-79`):

- Reads `mainFeatureName` / `featureItemName` inputs (route params via component input binding).
- `selectedFeature` finds the feature by `name` (`:27`); `selectedFeatureItem` is a `linkedSignal` that resolves the feature item, defaulting to the first item (`:28-34`).
- `selectedFeatureCards` maps the item's children into `FeatureCard[]` for the grid (`:36-47`).
- Mobile bottom-sheet navigation (`:49`), desktop `SidebarMenuComponent` (`features/sidebar-menu/sidebar-menu.component.ts:10-15`).
- SEO is updated reactively in an `effect` (`:52-67`); feature media opens `VideoDialogComponent` via `DialogService` (`:76-78`).
- Template renders video (`webm`/`mp4`) or image for the selected item's media, plus `content` prose (`features.component.html:13-29`).

### Pricing

`PricingComponent` (`src/app/pages/pricing/pricing.component.ts:20-57`):

- Loads `PricePlan[]` via `rxResource` (`getPricePlans`, `:37`) and filters to active plans (`:38`).
- Branches on `userAgentState().countrySupported`: supported countries render `SupportedPricingComponent` with plan cards; unsupported countries render `NotSupportedPricingComponent` with a "request pricing" form (`pricing.component.html:4-13`).
- `onRequestPricingContact` posts via `DataAccessService.postPricingRequest` and toasts result (`pricing.component.ts:41-56`).
- `SupportedPricingComponent` (`supported-pricing/supported-pricing.component.ts:14-17`); `PricingCardComponent` highlights the enterprise plan via `PricePlanType.Enterprise` (`pricing-card/pricing-card.component.ts:13-18`).
- `NotSupportedPricingComponent` (`not-supported-pricing/not-supported-pricing.component.ts:17-53`): form `{country, email, message, recaptchaToken}`, imports `NgxCaptchaModule`, emits `PricingRequest`; resets the form once submission completes via `effect` (`:30-36`).

### Tutorials

`TutorialsComponent` (`src/app/pages/tutorials/tutorials.component.ts:21-60`):

- Loads `getTutorials()` on init (`:35`) into the `tutorialsList` signal.
- Converts tutorial `Content` children into `VideoCard`s, deriving YouTube IDs with `extractYouTubeVideoId` and `hqdefault.jpg` previews (`:38-48`).
- Slide carousel via `activeIndex`/`sliderTransform` (`:30-31,50-55`); opening a video uses `DialogService` + `VideoDialogComponent` (`:57-59`).

### Contact Us

`ContactUsComponent` (`src/app/pages/contact-us/contact-us.component.ts:21-76`):

- Renders two switchable forms from `ContactUsPage.forms` metadata (`message` / `contactSales`), toggled by `activeFormType` (`:36-41`; template `contact-us.component.html:21-42`).
- Submits through `postContactUsMessageRequest` / `postContactUsSalesRequest` and toasts success/error (`:43-75`).
- Footer block renders team personas (`team/*.jpeg|png`), project-manager quote, and an external CTA to `intelact.co` (`contact-us.component.html:45-75`).
- `MessageFormComponent` (`message-form/message-form.component.ts:17-53`): `{name, email, message, recaptchaToken}`, required + `emailValidator`, emits `ContactUsMessageRequest`, resets on completion.
- `SalesTeamFormComponent` (`sales-team-form/sales-team-form.component.ts:18-80`): `{name, email, phone, subject, country, message, recaptchaToken}`; subject dropdown options `pages.contactUs.subjects.1..10` (`:34-46`).

### Agents

`AgentsComponent` (`src/app/pages/agents/agents.component.ts:22-47`):

- Renders hero + "Simple Way to Earn" steps from `AgentsPageData` (`agents.data.ts:3-151`).
- Resolves per-language image/media assets with `getLanguageAsset` (`:29-42`); feature grid via `FeatureGridComponent`; media opens the video dialog (`:44-46`).

### FAQ

`FaqComponent` (`src/app/pages/faq/faq.component.ts:17-24`): renders `faqsList` from `DataAccessService` inside `AccordionGroupComponent`; background from `FAQPageData.bgImageUrl`.

### Legal pages and 404

| Component                  | Source                                              | Notes                                                                                     |
| -------------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `TermsAndConditionsComponent` | `pages/terms-and-conditions/terms-and-conditions.component.ts:16-28` | Scrolls to URL fragment after render (`afterNextRender` + `scrollIntoView`)               |
| `PrivacyPolicyComponent`   | `pages/privacy-policy/privacy-policy.component.ts:20-34` | Same fragment-scroll behavior; `h2[id]` scroll margin for anchors                         |
| `ImpressumComponent`       | `pages/impressum/impressum.component.ts:14`         | Static template                                                                           |
| `DisclaimerComponent`      | `pages/disclaimer/disclaimer.component.ts:15`       | Static template                                                                           |
| `NotFoundComponent`        | `pages/not-found/not-found.component.ts:16`         | Inline gradient background, `RouterLink` home                                            |

## Core services

| Service                     | File                                                 | Key responsibilities                                                                                                                                                                                                                  |
| --------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LanguageService`           | `core/services/language.service.ts:11-96`            | Active language as `toSignal` on `onLangChange` (`:19-21`); `localStorage["du-pub-Lang"]` persistence (`:16,84-88`); `initAppLang` (`:25-31`); `normalizeLanguage` (`:61-68`); `getFirstSupportedLanguage` (`:70-82`); `instantTranslate` (`:33-35`) |
| `UserAgentService`          | `core/services/user-agent.service.ts:11-30`          | Holds `IGeoInfo` state signal (`:15-21`); `initUserAgent()` → `GET geoinfo` (`:23-25`); `updateState` (`:27-29`)                                                                                                                     |
| `DataAccessService`         | `core/services/data-access.service.ts:13-85`         | All portal data access; content signals (`:17-27`); GET endpoints (`:29-64`); reCAPTCHA-guarded POST endpoints (`:66-84`)                                                                                                              |
| `RecaptchaService`          | `core/services/recaptcha.service.ts:8-15`            | Wraps `ReCaptchaV3Service.executeAsPromise(siteKey, action, {useGlobalDomain:false, useEnterprise:false})` via `defer` (`:12-14`)                                                                                                      |
| `ToastService`              | `core/services/toast.service.ts:7-27`                | Success/error toasts with translated titles and Tailwind classes (`:13-26`)                                                                                                                                                           |
| `DialogService`             | `core/services/dialog.service.ts:7-21`               | `@angular/cdk/dialog` wrapper; `closeOnNavigation`, `hasBackdrop`, `disableClose` defaults (`:10-20`)                                                                                                                                 |
| `SEOService`                | `core/services/seo.service.ts:12-217`                | Title/description/keywords/author/robots/OG/Twitter/canonical link management; `updateMetaTags(route)` reads leaf route `data.meta` (`:165-208`); `getLeafData` (`:210-216`)                                                           |
| `Link`                      | `core/services/link.service.ts:6-96`                 | DOM `<link>` tag add/remove (canonical/alternate); used by `SEOService` (`updateCanonicalTag` at `seo.service.ts:150-155`)                                                                                                              |

Barrel: `core/services/index.ts`.

## HTTP interceptors and tokens

| Interceptor                     | File                                                   | Behavior                                                                                                                        |
| ------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| `userAgentHeadersInterceptor`   | `core/interceptors/user-agent-headers.interceptor.ts:6-30` | Adds `x-language` and `x-country-code` headers (names from `APP_CONFIG`) from `UserAgentService` state; skips `IS_EXTERNAL` requests (`:8`) |
| `baseUrlInterceptor`            | `core/interceptors/base-url.interceptor.ts:5-15`       | Prepends `NG_APP_API_URL` (trailing slashes normalized); skips `IS_EXTERNAL` and URLs containing `i18n` (`:10-11`)               |
| `cacheInterceptor`              | `core/interceptors/cache.interceptor.ts:9-29`          | In-memory `Map` cache keyed `url + "__lang_" + lang`; serves cached responses; only writes when `IS_CACHEABLE` context is true (`:21-27`) |

| Token            | File                                     | Type                  | Usage                                                        |
| ---------------- | ---------------------------------------- | --------------------- | ------------------------------------------------------------ |
| `APP_CONFIG`     | `core/tokens/app-config.token.ts:4`      | `InjectionToken<DuConfig>` | Injected by interceptors, services, providers                  |
| `IS_CACHEABLE`   | `core/tokens/is-cacheable.token.ts:3`    | `HttpContextToken<boolean>` | Set on all GET endpoints in `DataAccessService` (`data-access.service.ts:30,38,43,51,59`) |
| `IS_EXTERNAL`    | `core/tokens/is-external.token.ts:3`     | `HttpContextToken<boolean>` | Read by base-url + user-agent-headers interceptors; no request currently sets it true |

## Models and content data

### Core models

| Model                   | File                                                | Contents                                                                          |
| ----------------------- | --------------------------------------------------- | --------------------------------------------------------------------------------- |
| `AppRoutes`             | `core/models/routes.model.ts:1-19`                  | Route path constants incl. `FEATURES` object with `getFeatureItemRoute` helper (`:3-8`) |
| `DuConfig`              | `core/models/config.model.ts:3-11`                  | Environment-driven configuration shape                                            |
| `RecaptchaActions`      | `core/models/recaptcha-actions.model.ts:1-7`        | Actions: `requestPricing`, `contactUsMessage`, `contactUsSalesTeam`               |
| `PricingRequest`        | `core/temp-models.ts:1-6`                           | `{country, email, message, recaptchaToken}`                                       |
| `ContactUsMessageRequest` | `core/temp-models.ts:7-12`                        | `{name, email, message, recaptchaToken}`                                          |
| `ContactUsSalesRequest` | `core/temp-models.ts:13-21`                         | `{name, phone?, country, subject, email?, message, recaptchaToken}`               |

### Content data files (translation-key driven)

| File                            | Export                  | Purpose                                                                  |
| ------------------------------- | ----------------------- | ------------------------------------------------------------------------ |
| `core/data/header.data.ts:4-21` | `HeaderMenuItems`       | Home / Features / Pricing (tutorials commented out)                      |
| `core/data/footer.data.ts:4-68` | `FooterMenuItems`       | Menu / Features / Legal / More columns; features children filled at runtime (`app.ts:53-65`) |
| `core/data/pages/home.data.ts:1-83` | `HomePageData`      | All home section copy + image URLs, typed section aliases (`:75-83`)     |
| `core/data/pages/agents.data.ts:3-151` | `AgentsPageData` | Hero, 3 earn steps, 7 feature cards with per-language S3 image/video URLs (`:10-15,30-142`) |
| `core/data/pages/contact-us.data.ts:1-56` | `ContactUsPage` | Page header, form metadata (`message`/`contactSales`), footer personas   |
| `core/data/pages/faq.data.ts:1-8` | `FAQPageData`        | Header/title/description + background                                    |
| `core/data/pages/pricing.data.ts:1-29` | `PricingPageData` | Supported / not-supported sections + CTA box and form copy               |

## Shared layer

### Components (`src/app/shared/components/`)

| Component                    | Selector          | Notes                                                                                          | Source                                          |
| ---------------------------- | ----------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `AccordionGroupComponent`    | `du-accordion-group` | Preline `hs-accordion-group`-based FAQ accordion over `Content[]`; `openedIndex` model          | `accordion-group/accordion-group.component.ts:14-17` |
| `DropdownComponent`          | `du-dropdown`     | Generic `ControlValueAccessor` (`NG_VALUE_ACCESSOR` at `:11-17`); `DropdownOption<T>`           | `dropdown/dropdown.component.ts:20-78`          |
| `FeatureGridComponent`       | `article[du-feature-grid]` | Renders `FeatureCard[]`; media click resolves language asset + YouTube ID, emits `openMedia` | `feature-grid/feature-grid.component.ts:18-32`  |
| `LoadingSpinnerComponent`    | `du-loading-spinner` | Spinner shown inside submit buttons (`message-form.component.html:68-70`)                      | `loading-spinner/loading-spinner.component.ts:9` |
| `SocialsComponent`           | `du-socials`      | Social icon row (currently commented out in footer template)                                   | `socials/socials.component.ts:13-17`            |
| `TestimonialCardComponent`   | `du-testimonial-card` | Single testimonial card from `Content`                                                        | `testimonial-card/testimonial-card.component.ts:12-14` |
| `ToastMessageComponent`      | `du-toast-message` | Custom ngx-toastr toast; extends `Toast<{type}>`, success/error computed flags                  | `toast-message/toast-message.component.ts:14-18` |
| `VideoCardComponent`         | `du-video-card`   | Tutorial video card; YouTube preview with placeholder fallback (`/image/place-holder.png`)      | `video-card/video-card.component.ts:16-26`      |
| `VideoDialogComponent`       | `du-video-dialog` | CDK dialog embedding YouTube via `SanitizePipe` (`https://www.youtube.com/embed/{id}`)          | `video-dialog/video-dialog.component.ts:38-47`  |

### Models, pipes, utils, validators

- Models (`src/app/shared/models/`): `Slide` (`slide.model.ts:3-9`), `VideoCard` (`video-card.model.ts:1-6`), `DropdownOption<T>` (`dropdown-option.model.ts:1-5`), `SafeType` (`safe-type.model.ts:1-8`), `FeatureCard` (`feature-card.model.ts:3-12`), `ToastType` (`toast-type.model.ts:1-6`). Barrel `models/index.ts`.
- Pipes (`src/app/shared/pipes/`): `CurrencyPipe` (no-op placeholder, `currency.pipe.ts:7-14`), `SanitizePipe` (`sanitize.pipe.ts:11-30`, uses `DomSanitizer.bypassSecurityTrust*`), `TabSelectEffectsPipe` (`tab-select-effects.pipe.ts:7-21`, computes carousel tab classes by index). Barrel `pipes/index.ts`.
- Utils (`src/app/shared/utils/`): `groupByReduce` (`group-by.util.ts:1-11`), `extractYouTubeVideoId` (`youtube-id.util.ts:16-27`), `getLanguageAsset` (`language-asset.util.ts:11-29`). Barrel `utils/index.ts` exports only group-by and youtube-id (language-asset is imported directly).
- Validators (`src/app/shared/validators/`): `emailValidator` (`email.validator.ts:6-16`), RFC-ish regex at `:3`.

## Third-party integrations

| Package               | Version        | Used for                                                                                              | Key usage                                                                                          |
| --------------------- | -------------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `@driveup/shared`     | `^0.2.28`      | Shared domain types: `Link`, `Language`, `Content`, `PricePlanType`, `ColorContext`                    | `header.data.ts:2`, `app.ts:9`, `feature-card.model.ts:1`, `pricing-card.component.ts:2`            |
| `@intelact/common`    | `^0.2.14`      | `IResponse<T>` API envelope                                                                           | `data-access.service.ts:6`, `user-agent.service.ts:4`                                              |
| `@intelact/driveup`   | `^2.2.13`      | Domain models: `IGeoInfo` (geolocation/languages), `PricePlan`                                        | `app-initializer.provider.ts:4`, `user-agent.service.ts:5`, `data-access.service.ts:7`              |
| `@ngneat/svg-icon`    | `^8.0.0`       | Registered icon sets; `svg-icon` component (e.g. `header.component.html:15`)                          | `app.config.ts:34-38`                                                                               |
| `@ngneat/svg-generator` | `^7.0.3`     | `pnpm svg` generates `src/app/svg/*` from `public/svg/` (`prestart`/`prebuild` hooks, `package.json:15-18`) | `.svgGeneratorrc.json:2-3`                                                                      |
| `@ngx-translate/core` + `http-loader` | `^17.0.0` | Translation pipe/service, locale JSON loading                                                        | `app.config.ts:27`; `LanguageService`                                                               |
| `ngx-captcha`         | `^14.0.0`      | reCAPTCHA v3 invisible token (`ReCaptchaV3Service.executeAsPromise`)                                  | `recaptcha.service.ts:4,13`; `NgxCaptchaModule` in `app.ts:17` and `not-supported-pricing.component.ts:8` |
| `ngx-toastr`          | `^20.0.4`      | Toasts; custom `ToastMessageComponent` (`provideToastr` at `app.config.ts:48-53`)                     | `toast.service.ts`                                                                                  |
| `preline`             | `^3.2.3`       | UI behaviors; `HSStaticMethods.autoInit()` re-run after navigation (`app.ts:96`)                      | `angular.json:47` (script), `global.d.ts:6`                                                         |
| `@angular/cdk`        | `^21.1.3`      | Dialogs (`Dialog`, `DIALOG_DATA`)                                                                     | `dialog.service.ts`, `video-dialog.component.ts`                                                    |

## Server and deployment

- `server.mjs:8-44` — Express 5: static assets from `dist` with `Cache-Control: immutable, max-age=1y` (`:19-25`), `/health` endpoint (`:28-30`), `index.html` on `/` (`:33-35`) and SPA fallback for all unmatched routes (`:38-40`), listens on `process.env.PORT || 3000` (`:9,42-44`).
- `.do/app.yaml` — DigitalOcean App Platform spec: Node build (`pnpm install; pnpm build`), build-time env (`NG_APP_ENV=production`, `NG_APP_API_URL=https://api.driveup.pro`, header names `x-language`/`x-country-code`, etc., `.do/app.yaml:25-53`), `http_port: 3000`, run `pnpm start:prod` (→ `node server.mjs`, `package.json:8`), domain `driveup.pro` (`:7-9`).
- `package.json` scripts: `start`/`start:prod` = `node server.mjs`; `start:dev` = `ng serve`; `svg` runs before start/build/watch via `pre*` hooks (`package.json:5-18`).

## Known discrepancies

- **SSR claim vs. static build**: README/overview say Angular SSR (`@angular/ssr` + express), but `angular.json:33-34` sets `"server": false` / `"outputMode": "static"`, `@angular/ssr` is not a dependency, and `server.mjs` is a plain static Express server with SPA fallback. Treat the portal as a static SPA.
- **Footer "Features" link bug**: `footer.data.ts:14` interpolates the `AppRoutes.FEATURES` **object** into a template string (`/${AppRoutes.FEATURES}`), producing a `/[object Object]` `href`. The header uses the correct `AppRoutes.FEATURES.mainRoute` (`header.data.ts:11`).
- **`pages.tutorials` i18n keys absent**: the tutorials route declares SEO keys `pages.tutorials.meta.*` (`app.routes.ts:73-78`), but `en.json` has no `pages.tutorials` block (only the commented-out menu keys exist as `header.menu.tutorials`/`footer...tutorials`). `SEOService.updateTitle` would fall back to the site name for these.
- **Form `recaptchaToken` control is never set in the UI**: message/sales/pricing forms declare a `recaptchaToken` control (e.g. `message-form.component.ts:27`), but the token is generated server-side inside `DataAccessService` (merged over the body via `{ ...body, recaptchaToken }`, `data-access.service.ts:69,76,83`); the control itself stays empty.
- **No unit tests despite Vitest setup**: `tsconfig.spec.json` and `@ngx-env/builder:unit-test` (`angular.json:88`) are configured, but there are currently no `*.spec.ts` files under `src/`.
- **`NG_APP_IMAGE_HOST_URL` unused**: defined in `DuConfig` and provided (`app.config.ts:42`) but not referenced elsewhere in `src/`.
- **`CurrencyPipe` is a no-op** (`currency.pipe.ts:8-13`): returns the value unchanged (or `null`); no actual currency formatting.

## Source lookup guide

1. Find the route in `src/app/app.routes.ts` (or `AppRoutes` in `core/models/routes.model.ts`), then open the lazy-loaded page folder under `src/app/pages/`.
2. Page copy/labels come from `core/data/pages/*.data.ts` keys resolved through `public/i18n/<lang>.json`; component templates pipe those keys with `| translate`.
3. Server data flows through `DataAccessService` signals/`rxResource`; endpoints and their `IS_CACHEABLE` markers are listed in [Architecture — State and data flow](../portal/architecture.md).
4. For form submission and spam protection, follow the reCAPTCHA flow in `RecaptchaService` → `DataAccessService.post*` → page submit handlers → `ToastService`.
5. SEO behavior: static metadata from route `data`, dynamic metadata via `SEOService` calls in components (`FeaturesComponent` effect, `App` on `NavigationEnd`).
6. Cite `file:line` and flag any mismatch between this map, the README, and the code.
