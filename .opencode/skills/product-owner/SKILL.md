---
name: product-owner
description: Product Spec Validator for DriveUp monorepo. Interprets Gherkin specs (gnosa/features for admin, docs/kb/features for mobile), validates implementation coverage across platforms, maintains living coverage matrix, answers product questions from specifications.
---

# Product Owner - Spec Validation & Coverage

Use this skill to answer product questions from Gherkin specifications, validate feature completeness across platforms, maintain a living coverage matrix, and assess release readiness.

## DriveUp Specification Sources

| Source | Platform | Location | Structure |
|--------|----------|----------|-----------|
| **Admin Specs** | driveup-admin, driveup-api | `gnosa/features/` | `admin/`, `public/` subfolders |
| **Mobile Specs** | driveup-mobile | `docs/kb/features/` | `Mobile/{Student,Instructor,Agent}/` hierarchy |
| **Shared Types** | All platforms | `@driveup/shared`, `@intelact/driveup` | Private packages |

### Spec Hierarchy Example (Mobile)
```
docs/kb/features/
├── Mobile/
│   ├── Student/
│   │   ├── Manage user account/
│   │   │   ├── Switch user profile/
│   │   │   ├── Hyperlinks+Logout/
│   │   │   ├── Create new profile/
│   │   │   ├── Change language/
│   │   │   ├── Add+Edit profile picture/
│   │   │   └── Manage profile settings/
│   │   ├── Courses/
│   │   │   ├── Payments/
│   │   │   ├── Parts/
│   │   │   └── Overview/
│   │   └── ...
│   ├── Instructor/
│   └── Agent/
```

---

## Core Workflows

### 1. Spec Interpretation & Query Answering

**Trigger**: "What does the spec say about student profile switching?"

**Process**:
1. **Locate relevant specs**:
   ```bash
   # Admin specs
   find gnosa/features -name "*.feature" -exec grep -l "profile\|switch" {} \;
   
   # Mobile specs
   find docs/kb/features -name "*.feature" -exec grep -l "profile\|switch" {} \;
   ```
2. **Extract scenarios** with Given/When/Then steps
3. **Identify business rules**, edge cases, constraints
4. **Cross-reference** admin vs mobile for same feature

**Output Format**:
```
## Spec Answer: Student Profile Switching

### Mobile Specs (docs/kb/features/Mobile/Student/Manage user account/Switch user profile/)
**Feature**: Switch user profile
- **Scenario**: User can view available profiles
  - Given user has multiple profiles (Student, Agent)
  - When user opens profile switcher
  - Then all profiles are listed with type and name
- **Scenario**: User can switch profile
  - Given user is on Student profile
  - When user selects Agent profile
  - Then app switches to Agent dashboard
  - And user sees Agent-specific navigation

### Admin Specs (gnosa/features/admin/)
**No direct equivalent** - admin uses persona-based routing via guards, not profile switching within session

### Business Rules Extracted
1. Students can have multiple profile types (Student, Agent)
2. Profile switch preserves session (no re-auth)
3. Switch triggers dashboard redirect based on profile type
4. Profile creation has constraints (no duplicate Student profiles)

### Open Questions for Team
- Can Instructors switch profiles? (No mobile spec found)
- What happens to unsaved data on switch? (Not specified)
```

---

### 2. Coverage Matrix (Living Document)

**Maintain**: `.opencode/coverage-matrix.md` (or `docs/qa/coverage-matrix.md`)

**Structure**:
```markdown
# DriveUp Feature Coverage Matrix

*Last updated: 2026-10-04 | Spec version: gnosa@HEAD, docs/kb@HEAD*

## Legend
✅ = Implemented & tested | ⚠️ = Partial | ❌ = Not implemented | 🔄 = In progress | N/A = Not applicable

---

### Authentication & Authorization

| Feature / Scenario | Admin (Angular) | Portal (Angular) | Mobile (Flutter) | API (NestJS) | Spec Source | Notes |
|--------------------|-----------------|------------------|------------------|--------------|-------------|-------|
| **Sign In - Request OTP** | | | | | | |
| Authorized admin OTP request | ✅ | N/A | ✅ | ✅ | gnosa:sign_in:13 | |
| No account enumeration | ✅ | N/A | ❌ | ✅ | gnosa:sign_in:21 | Mobile gap |
| Email format validation | ✅ | N/A | ✅ | ✅ | gnosa:sign_in:28 | |
| Invalidate previous OTP | ✅ | N/A | ⚠️ | ✅ | gnosa:sign_in:33 | Mobile: only on verify |
| Email rate limit (5/15min) | ✅ | N/A | ❌ | ✅ | gnosa:sign_in:41 | Mobile gap |
| IP rate limit (5/15min) | ✅ | N/A | ❌ | ✅ | gnosa:sign_in:48 | Mobile gap |
| **OTP Verification** | | | | | | |
| Valid OTP redirects to dashboard | ✅ | N/A | ✅ | ✅ | gnosa:otp_verification:12 | |
| Expired OTP rejected | ✅ | N/A | ✅ | ✅ | gnosa:otp_verification:19 | |
| Max 3 attempts then lock | ✅ | N/A | ❌ | ✅ | gnosa:otp_verification:26 | Mobile gap |

---

### Student Profile Management

| Feature / Scenario | Admin | Portal | Mobile | API | Spec Source | Notes |
|--------------------|-------|--------|--------|-----|-------------|-------|
| **Switch Profile** | | | | | | |
| View available profiles | N/A | N/A | ✅ | ✅ | kb:Switch user profile:8 | Admin uses persona routing |
| Switch profile | N/A | N/A | ✅ | ✅ | kb:Switch user profile:15 | |
| Move to profile settings | N/A | N/A | ✅ | ✅ | kb:Switch user profile:22 | |
| **Create Profile** | | | | | | |
| Student can't create 2nd Student | N/A | N/A | ✅ | ✅ | kb:Create new profile:8 | |
| Agent can't create 2nd Agent | N/A | N/A | ✅ | ✅ | kb:Create new profile:15 | |
| Add new profile flow | N/A | N/A | ✅ | ✅ | kb:Create new profile:22 | |
| **Profile Picture** | | | | | | |
| Upload picture | N/A | N/A | ✅ | ✅ | kb:Add+Edit profile picture:8 | |
| Replace picture | N/A | N/A | ✅ | ✅ | kb:Add+Edit profile picture:15 | |
| Remove picture | N/A | N/A | ✅ | ✅ | kb:Add+Edit profile picture:22 | |
| Camera capture | N/A | N/A | ✅ | ✅ | kb:Add+Edit profile picture:29 | |
| Not mandatory | N/A | N/A | ✅ | ✅ | kb:Add+Edit profile picture:36 | |
```

**Update Process**:
1. After each PR/merge, update relevant rows
2. Link to PR, test files, JIRA tickets
3. Review monthly for accuracy

---

### 3. Acceptance Criteria Validation

**Trigger**: "Validate PR #1234 implements all acceptance criteria for 'Student Course Overview'"

**Process**:
1. **Find spec**: `docs/kb/features/Mobile/Student/Courses/Overview/Show course details/`
2. **Extract all scenarios** (each = 1 AC)
3. **Map to implementation**:
   - Mobile: `driveup-mobile/lib/features/student/courses/overview/`
   - Admin (if applicable): `driveup-admin/src/app/profiles/student/features/courses/`
   - API: `driveup-api/src/courses/`
4. **Verify each scenario step** has corresponding test + implementation

**Validation Checklist per Scenario**:
- [ ] **Given** steps → Test setup / preconditions implemented
- [ ] **When** steps → User actions implemented in UI
- [ ] **Then** steps → Assertions in tests + UI behavior
- [ ] **And** steps → Additional assertions covered
- [ ] **Edge cases** (background, examples) → Covered in tests

**Output**:
```
## AC Validation: Student Course Overview (PR #1234)

### Spec: docs/kb/features/Mobile/Student/Courses/Overview/Show course details/

| Scenario | Given Implemented | When Implemented | Then Verified | Test Coverage | Status |
|----------|-------------------|------------------|---------------|---------------|--------|
| User sees own balance | ✅ API returns balance | ✅ Screen loads | ✅ Balance displayed | Maestro: courses_overview.yaml | ✅ PASS |
| User sees course progress | ✅ API returns progress | ✅ Progress card | ✅ % shown | Maestro + Unit | ✅ PASS |
| User sees course name/desc | ✅ API returns details | ✅ Header renders | ✅ Text matches | Snapshot test | ✅ PASS |
| User sees course location | ✅ API returns location | ✅ Location chip | ✅ Address shown | ❌ No test | ⚠️ GAP |
| Click finances → Payment tab | ✅ Navigation setup | ✅ Tap handler | ✅ Route changes | Maestro: navigation.yaml | ✅ PASS |
| Click progress → Parts tab | ✅ Navigation setup | ✅ Tap handler | ✅ Route changes | ❌ No test | ⚠️ GAP |

### Missing Test Coverage
1. Course location display - add Maestro assertion
2. Progress card navigation - add Maestro flow

### Recommendation
Add 2 Maestro flows before merge. Update coverage matrix.
```

---

### 4. Cross-Platform Parity Analysis

**Trigger**: "Compare course booking feature between admin and mobile"

**Process**:
1. **Identify all related specs** in both sources
2. **Create feature parity matrix**

**Output**:
```
## Parity Analysis: Course Booking

### Admin (gnosa/features/admin/)
- **Books List**: View, filter, search, paginate
- **Book Editor**: Create/edit books, set metadata
- **Booking Management**: View bookings, confirm/cancel, waitlist

### Mobile (docs/kb/features/Mobile/Student/Courses/)
- **Parts**: View parts, select slots, see progress, evidence
- **Overview**: Course header, details, finances, progress
- **Payments**: Financial overview, transaction flow

### Gaps
| Capability | Admin | Mobile | API | Notes |
|------------|-------|--------|-----|-------|
| Waitlist management | ✅ | ❌ | ✅ | Mobile: no waitlist UI |
| Booking cancellation | ✅ | ✅ | ✅ | Parity OK |
| Slot selection (flexible) | N/A | ✅ | ✅ | Mobile-only concept |
| Instructor booking view | ✅ | ❌ | ✅ | Mobile: student-only |
| Booking history | ✅ | ✅ | ✅ | Parity OK |
| Evidence of participation | ❌ | ✅ | ✅ | Admin: not in spec |

### Spec Alignment Issues
1. Admin has "Books" (library), Mobile has "Courses/Parts" (training) - different domains?
2. Verify terminology: "Booking" (admin) vs "Appointment/Slot" (mobile)
```

---

### 5. Release Readiness Assessment

**Trigger**: "Release checklist for v2.5.0 - Student Course Management epic"

**Process**:
1. **Identify all specs** for the epic
2. **Check coverage matrix** for each scenario
3. **Verify test status** (passing, flaky, missing)
4. **Check open bugs** linked to scenarios
5. **Generate release report**

**Release Report Template**:
```
## Release Readiness: Student Course Management Epic v2.5.0

### Scope (from specs)
- Mobile: Courses/Overview, Courses/Parts, Courses/Payments
- Admin: Books List, Books Editor (if related)
- API: Courses, Appointments, Payments modules

### Coverage Summary
| Platform | Scenarios Total | ✅ Covered | ⚠️ Partial | ❌ Missing | Blocking Bugs |
|----------|-----------------|------------|------------|------------|---------------|
| Mobile | 24 | 21 | 2 | 1 | 0 |
| Admin | 12 | 12 | 0 | 0 | 0 |
| API | 18 | 18 | 0 | 0 | 0 |

### Critical Gaps
1. **Mobile**: "User sees course location" - no test, UI implemented but unverified
2. **Mobile**: "Click progress → Parts tab" - navigation not tested

### Flaky Tests (last 30 days)
- `courses_overview.yaml` - 2/20 flakes (network timing)
- `courses_parts_flexible.yaml` - 1/20 flakes (slot selection timing)

### Open Bugs (P0/P1)
- None blocking

### Go/No-Go Decision
**CONDITIONAL GO** - Fix 2 test gaps before release, monitor flakes
```

---

## Commands Reference

```bash
# List all admin features
find gnosa/features -name "*.feature" | sed 's|gnosa/features/||' | sed 's|.feature||' | sort

# List all mobile features
find docs/kb/features -name "*.feature" | sed 's|docs/kb/features/||' | sed 's|.feature||' | sort

# Search scenarios by keyword
grep -r "payment\|financ" gnosa/features/ docs/kb/features/ --include="*.feature" -A 3 -B 1

# Count scenarios per feature
for f in gnosa/features/**/*.feature; do echo "$(grep -c "Scenario:" "$f") - $f"; done | sort -rn

# Generate spec inventory
./scripts/generate-spec-inventory.sh  # Create if needed

# Update coverage matrix (manual process, automate later)
# Edit docs/qa/coverage-matrix.md
```

---

## Coverage Matrix Maintenance

### File Location
- **Primary**: `docs/qa/coverage-matrix.md` (committed to repo)
- **Backup**: `.opencode/coverage-matrix.md` (local working copy)

### Update Triggers
- After PR merge (CI can auto-update with test results)
- Before release planning
- When spec changes (new scenarios added/removed)

### Automation Ideas
- CI job: Parse Gherkin → Check test existence → Update matrix
- Git hook: Warn if `.feature` changed but matrix not updated
- Dashboard: Render matrix as HTML for stakeholders

---

## Integration with Other Skills

- Use `/reviewer` to verify implementation matches spec details
- Use `/tester` to create test cases for uncovered scenarios
- Use `/cypress-author` to write missing Cypress tests
- Use `/maestro` to write missing Maestro flows
- Use `/cypress-explain` to audit test quality for covered scenarios