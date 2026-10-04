---
name: reviewer
description: Cross-platform code reviewer for DriveUp monorepo. Compares implementations across driveup-admin (Angular), driveup-portal (Angular), driveup-mobile (Flutter), driveup-api (NestJS), and Gherkin specs. Validates code-level patterns and behavioral consistency.
---

# Reviewer - Cross-Platform Code Review

Use this skill when reviewing PRs, comparing feature implementations across platforms, auditing architectural compliance, or validating spec adherence in the DriveUp monorepo.

## DriveUp Monorepo Context

| Platform | Tech Stack | Key Paths |
|----------|------------|-----------|
| **driveup-admin** | Angular 22, NgRx, Signals, standalone components | `driveup-admin/src/app/` |
| **driveup-portal** | Angular 22, similar structure | `driveup-portal/src/app/` |
| **driveup-mobile** | Flutter, Riverpod/BLoC | `driveup-mobile/lib/` |
| **driveup-api** | NestJS, TypeORM, TypeScript | `driveup-api/src/` |
| **Shared Types** | @driveup/shared, @intelact/driveup, @intelact/common | Private packages, check `node_modules` or sibling repos |
| **Specs (Admin)** | Gherkin in `gnosa/features/` | `gnosa/features/**/*.feature` |
| **Specs (Mobile)** | Gherkin in `docs/kb/features/` | `docs/kb/features/**/*.feature` |

---

## Review Workflows

### 1. Cross-Platform Feature Consistency Review

**Trigger**: "Review the authentication flow implementation across all platforms"

**Process**:
1. **Identify the feature scope** from Gherkin specs:
   - Admin: `gnosa/features/admin/sign_in.feature`, `gnosa/features/admin/otp_verification.feature`
   - Mobile: `docs/kb/features/Mobile/Student/Manage user account/`
2. **Map implementations**:
   - Admin: `driveup-admin/src/app/auth/`, `driveup-admin/src/app/state/auth/`
   - Portal: `driveup-portal/src/app/auth/` (if exists)
   - Mobile: `driveup-mobile/lib/features/auth/`, `driveup-mobile/lib/core/auth/`
   - API: `driveup-api/src/auth/`, `driveup-api/src/user/`
3. **Compare at both levels**:

#### Code-Level Consistency
- **DTO/Type alignment**: Same `@intelact/driveup` types used? Check `AuthRequestDto`, `OtpResponseDto`, `UserProfile`
- **API contract**: Request/response shapes match between API controllers and frontend services
- **Error handling**: Consistent error codes, messages, HTTP status codes
- **Validation rules**: Email format, OTP length, rate limits identical
- **State management patterns**: NgRx effects (admin) vs Riverpod providers (mobile) vs NestJS guards (API)

#### Behavioral Consistency
- **User flows**: Same steps, same edge cases handled
- **Rate limiting**: 5 requests/15min per email AND per IP on all platforms
- **OTP invalidation**: Previous OTP invalidated on new request everywhere
- **Security**: No account enumeration on any platform
- **Offline/loading states**: Consistent UX patterns

**Output Format**:
```
## Cross-Platform Review: Admin Sign-In / OTP Flow

### 📋 Spec Coverage
| Scenario | Admin | Portal | Mobile | API |
|----------|-------|--------|--------|-----|
| Request OTP for authorized admin | ✅ | ❌ N/A | ✅ | ✅ |
| No account enumeration | ✅ | - | ✅ | ✅ |
| Email format validation | ✅ | - | ✅ | ✅ |
| Invalidate previous OTP | ✅ | - | ⚠️ Partial | ✅ |
| Email rate limit (5/15min) | ✅ | - | ❌ Missing | ✅ |
| IP rate limit (5/15min) | ✅ | - | ❌ Missing | ✅ |

### 🔍 Code-Level Findings
1. **DTO Mismatch**: Mobile sends `otp_code` but API expects `otpCode` (camelCase vs snake_case)
2. **Rate Limit**: Mobile missing IP-based rate limit implementation
3. **Error Codes**: Admin uses `AUTH_OTP_RATE_LIMITED`, Mobile uses `RATE_LIMIT_EXCEEDED`

### 🎯 Behavioral Gaps
1. Mobile allows OTP request for unregistered emails (reveals account existence)
2. Portal not applicable (public marketing site)

### ✅ Recommendations
- Align DTO field naming in shared package
- Add IP rate limiting to mobile repository
- Standardize error code constants in @driveup/shared
```

---

### 2. Architectural Compliance Review

**Trigger**: "Review this PR for DriveUp architectural patterns"

**Checklists by Platform**:

#### driveup-admin (Angular/NgRx)
- [ ] Standalone components, `OnPush` change detection
- [ ] New control flow: `@if`/`@for` only (no `*ngIf`/`*ngFor`)
- [ ] Signals for local state: `signal()`, `computed()`, `input()`, `output()`
- [ ] Facade pattern: Components inject facades, not `Store` directly
- [ ] `CoreService` extension for API services (`_getData`, `_postData`, etc.)
- [ ] API routes in `ApiRoutes` (`platform/configs/api-routes.ts`)
- [ ] App routes in `AppRoutes` (`platform/configs/app-routes.ts`)
- [ ] Guards: functional `CanActivateFn`, use persona guards
- [ ] Private fields: `#field` syntax, not `private`
- [ ] Barrel imports via `index.ts` when available
- [ ] NgRx: singular `*.effect.ts` preferred, slices under `state/<slice>/`

#### driveup-mobile (Flutter)
- [ ] Riverpod providers for state (or BLoC if established)
- [ ] Repository pattern for data layer
- [ ] Freezed/JSON serializable for DTOs
- [ ] GoRouter for navigation with typed routes
- [ ] Platform channels only in designated modules
- [ ] Test coverage: unit + widget + integration

#### driveup-api (NestJS)
- [ ] DTOs with class-validator decorators
- [ ] TypeORM entities in `driveup-schema` (separate repo)
- [ ] Guards for auth/roles, interceptors for logging/transform
- [ ] Swagger/OpenAPI decorators on controllers
- [ ] Exception filters for consistent error responses
- [ ] Shared types from @driveup/shared, @intelact/driveup

---

### 3. API Contract Review

**Trigger**: "Check if the new /api/v1/courses endpoint matches the shared types"

**Process**:
1. Find shared types: `grep -r "CoursesDto\|CourseDto" --include="*.ts" node_modules/@intelact/driveup/ 2>/dev/null || find ../driveup-shared ../driveup-common -name "*.ts" -exec grep -l "Course" {} \;`
2. Check API controller: `driveup-api/src/courses/courses.controller.ts`
3. Check admin service: `driveup-admin/src/app/profiles/company/api/courses.service.ts`
4. Check mobile repository: `driveup-mobile/lib/features/courses/data/courses_repository.dart`
5. Validate: field names, types, required/optional, enums, pagination format

---

### 4. Security & Performance Audit

**Common Checks**:
- **Auth**: Token refresh flow, 401 handling, verification endpoints excluded
- **Interceptors**: Order matters (header → error → auth → response)
- **Guards**: Persona guards check `selectedProfile()` and redirect correctly
- **N+1 queries**: Check TypeORM relations, DataLoader usage
- **Bundle size**: Angular lazy loading, Flutter deferred components
- **Caching**: `cy.session()` equivalent, HTTP cache headers

---

## Commands Reference

```bash
# Find feature implementations across platforms
grep -r "signIn\|otpVerification" driveup-admin/src/app/auth/ driveup-mobile/lib/features/auth/ driveup-api/src/auth/ 2>/dev/null

# Compare DTO usage
grep -r "AuthRequestDto\|OtpResponseDto" driveup-admin/ driveup-portal/ driveup-mobile/ driveup-api/ --include="*.ts" --include="*.dart"

# Check Gherkin spec coverage
grep -r "Scenario:" gnosa/features/admin/sign_in.feature docs/kb/features/Mobile/Student/Manage\ user\ account/

# Find architectural violations
grep -r "\*ngIf\|\*ngFor" driveup-admin/src/app/ --include="*.html"  # Should be 0 results
grep -r "private " driveup-admin/src/app/ --include="*.ts" | grep -v "#"  # Should use #field
```

---

## Integration with Other Skills

- Use `/cypress-explain` to review Cypress test quality for the feature
- Use `/maestro` to review Maestro flow quality for mobile
- Use `/product-owner` to verify spec coverage completeness
- Use `/tester` to check test case mapping and bug history