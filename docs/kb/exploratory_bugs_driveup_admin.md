# Exploratory Testing Bugs - DriveUp Admin

Bug tickets created from exploratory testing of DriveUp Admin platform. Ordered by severity: **Critical → High → Medium → Low**.

---

## CRITICAL

### BUG-001: Downloading any document logs out the user

**Preconditions:**
- User is logged into DriveUp Admin (manager_dU role)
- User has access to documents (invoices, contracts, certificates, etc.)

**Reproduction Steps:**
1. Log in to DriveUp Admin as a manager
2. Navigate to any module with downloadable documents (e.g., Invoices, Trainings, Students)
3. Click the download button/icon for any document (PDF, invoice, certificate)
4. Observe the behavior after download initiates

**Actual Behaviour:**
- Document download starts
- User session is terminated
- User is redirected to login page
- User must log in again to continue working

**Expected Behaviour:**
- Document downloads successfully
- User remains logged in and on the same page
- Session persists after download

**Severity:** Critical
**Priority:** Highest
**Component:** web-dU, manager_dU
**Labels:** BLOCKER, API_bug, AUTHENTICATION, REGRESSION

**Related Test Cases:**
- DU-TXXXX: [Need to verify if test case exists for document download]
- DU-TXXXX: [Need to verify if test case exists for session persistence]

**Historical Context:**
- No existing bug found for this specific issue in the database
- This is a critical security/session management bug affecting all document downloads
- Blocks core workflow for managers who need to download invoices, contracts, certificates

---

## HIGH

### BUG-002: Invited instructor sees empty info page at the end of the onboarding process

**Preconditions:**
- Instructor has been invited by a manager via DriveUp Admin
- Instructor has accepted invitation and started onboarding
- Instructor has completed personal data entry steps

**Reproduction Steps:**
1. As manager, invite a new instructor via Team Management
2. As invited instructor, accept invitation and begin onboarding
3. Complete all required data entry steps (personal info, license, etc.)
4. Reach the final info pages (feature introduction screens)
5. Complete the info pages

**Actual Behaviour:**
- Final info page(s) display empty/blank content
- No feature information, images, or text is shown
- Instructor cannot properly complete onboarding flow

**Expected Behaviour:**
- Info pages display proper feature introduction content
- Images, text, and navigation buttons are visible
- Instructor can complete onboarding successfully

**Severity:** High
**Priority:** High
**Component:** web-dU, manager_dU, instructor_dU
**Labels:** ONBOARDING, INSTRUCTOR, UI_BUG, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Authentication/Instructor onboarding/Invited instructor setup (folder exists in zephyr.xml)
- DU-TXXXX: [WEB] Pass onboarding info pages on instructor initial sign in (zephyr.xml line 2265)

**Historical Context:**
- Similar issue: DU-1411 "Company language not persisted for newly invited instructors" (line 63562)
- Bug at line 9149: "The info pages are shown empty" - likely same root cause
- Existing test cases cover onboarding flow but may not cover empty state

---

### BUG-003: Administration fee toggle inside training has wrong logic - shows "Administration fee" and is ON by default

**Preconditions:**
- Manager is logged into DriveUp Admin
- A driving category/training exists or is being created
- Administration fee configuration is accessible

**Reproduction Steps:**
1. Navigate to training/category settings
2. Locate the administration fee toggle/switch
3. Observe the default state and label

**Actual Behaviour:**
- Toggle shows label "Administration fee" (or "Verwaltungsgebühr" in German)
- Toggle is **ON by default**
- User must manually turn OFF to indicate "no admin fee"

**Expected Behaviour:**
- Toggle label should read "No admin fee" (or "Keine Verwaltungsgebühr")
- Toggle should be **OFF by default** (meaning admin fee is not charged unless explicitly enabled)
- When ON → "No admin fee" = no fee charged
- When OFF → Admin fee applies (configurable amount)

**Severity:** High
**Priority:** High
**Component:** web-dU, manager_dU
**Labels:** FINANCIAL, ADMIN_FEE, LOGIC_BUG, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Manage category settings/Edit category (zephyr.xml line 85)
- DU-TXXXX: DriveUp Admin/Web Manager/Manage category settings/Show list of categories (zephyr.xml line 86)
- Mobile test: "Implement 'No admin fee' switcher in mobile" (zephyr_mobile.xml line 20856)

**Historical Context:**
- **DU-901**: "Correct label not shown for empty administration fee" (line 92286) - label shows "Administration fee" instead of "No Administration Fee" when empty
- **DU-731**: "0.00 is added automatically for administration fee causes changes not to be saved when in edit mode" (line 100314)
- These are related but distinct issues - this bug is about the **toggle logic and default state**

---

### BUG-004: Reference number of student license behaves like a mandatory field - must be optional

**Preconditions:**
- Manager is creating/editing a student training
- Student license reference number field is present in the form

**Reproduction Steps:**
1. Navigate to create/edit student training
2. Fill all mandatory fields except "Reference number" (license reference)
3. Attempt to save the training
4. Observe validation behavior

**Actual Behaviour:**
- Form validation prevents saving without reference number
- Field behaves as mandatory (required)
- Error message may appear indicating field is required

**Expected Behaviour:**
- Reference number field should be **optional**
- Training can be saved without entering a reference number
- Field accepts empty value

**Severity:** High
**Priority:** High
**Component:** web-dU, manager_dU, student_dU
**Labels:** VALIDATION, STUDENT_LICENSE, DATA_ENTRY, APPROVED

**Related Test Cases:**
- DU-TXXXX: Mobile test "User can see license reference number" (zephyr_mobile.xml line 8931)
- DU-TXXXX: DriveUp Admin/Web Manager/Driving Trainings/Add new driving training (zephyr.xml line 55)

**Historical Context:**
- No direct duplicate found in bug database
- Reference number should be optional per business requirements (not all countries/licenses have reference numbers)

---

### BUG-005: Reinstate button is missing for completed and terminated training

**Preconditions:**
- Manager is logged into DriveUp Admin
- Training exists in "Completed" or "Terminated" status
- Manager has permission to manage trainings

**Reproduction Steps:**
1. Navigate to Trainings list (Driving Trainings or Course Trainings)
2. Filter for "Completed" or "Terminated" status trainings
3. Open training details
4. Look for "Reinstate" or "Reactivate" button/action

**Actual Behaviour:**
- No reinstate/reactivate button is visible
- No option to revert completed/terminated training back to active
- Training appears permanently locked in final state

**Expected Behaviour:**
- "Reinstate" button should be available for Completed and Terminated trainings
- Clicking it should revert training to "In Progress" or "Active" status
- Appropriate confirmation dialog should appear
- Audit trail should record the reinstatement

**Severity:** High
**Priority:** High
**Component:** web-dU, manager_dU
**Labels:** TRAINING_MANAGEMENT, WORKFLOW, MISSING_FEATURE, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Driving Trainings/Manage driving trainings (zephyr.xml line 59)
- DU-TXXXX: DriveUp Admin/Web Manager/Courses/Manage course trainings /End course trainings (zephyr.xml line 47)
- Mobile test: "User can view the completed training in the archived trainings list" (zephyr_mobile.xml line 16671)

**Historical Context:**
- Bug at line 253 mentions: "User can re-invite any former team member... either through the reinstate button on the admin platform"
- Bug at line 11960: "User has 10 completed sessions for a training" - related to completed training handling
- DU-1039: "User can add appointments for terminated trainings" (line 82503) - shows terminated trainings should have restrictions but not be completely locked

---

## MEDIUM

### BUG-006: Course overview calendar is badly implemented - must be hidden until Pro version

**Preconditions:**
- Manager is logged into DriveUp Admin
- Company does NOT have Pro subscription/license
- Course overview/calendar feature is visible

**Reproduction Steps:**
1. Log in as manager of a non-Pro company
2. Navigate to Course Overview/Calendar section
3. Observe calendar visibility and functionality

**Actual Behaviour:**
- Course overview calendar is visible and accessible
- Feature appears partially implemented/broken
- Non-Pro users can see/access a feature they shouldn't have

**Expected Behaviour:**
- Course overview calendar should be **hidden completely** for non-Pro companies
- Feature should only be visible/enabled when company has active Pro subscription
- Proper upsell/upgrade prompt should appear if user tries to access via direct URL

**Severity:** Medium
**Priority:** High
**Component:** web-dU, manager_dU
**Labels:** FEATURE_FLAG, SUBSCRIPTION, PRO_VERSION, UI_BUG, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Courses/General Overview (zephyr.xml line 44)
- DU-TXXXX: DriveUp Admin/Web Manager/Courses/Browse list of course trainings (zephyr.xml line 33)

**Historical Context:**
- No direct duplicate found
- Feature gating by subscription tier is a common pattern in the app

---

### BUG-007: Finance overview - date range field for the diagram is too narrow and truncates the content

**Preconditions:**
- Manager is logged into DriveUp Admin
- Finance overview dashboard is accessible
- Date range selector for financial diagram is present

**Reproduction Steps:**
1. Navigate to Finance Overview / Financial Dashboard
2. Locate the date range selector for the diagram/chart
3. Click to open date range picker
4. Observe the width and content display

**Actual Behaviour:**
- Date range input field is too narrow
- Selected date range text is truncated/cut off
- User cannot see full date range (e.g., "01.01.2026 - 31.12.2026" shows as "01.01.2026 - 31...")
- Poor UX for date selection

**Expected Behaviour:**
- Date range field should be wide enough to display full date range text
- No truncation of selected dates
- Proper responsive design for different screen sizes

**Severity:** Medium
**Priority:** Medium
**Component:** web-dU, manager_dU
**Labels:** UI_BUG, FINANCE, DATE_PICKER, TRUNCATION, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Finances Dashboard/View financial history (zephyr.xml line 63)
- DU-TXXXX: "User can filter list of students by registration date range" (zephyr.xml line 10925)
- DU-TXXXX: "User can filter list of courses based on date range" (zephyr.xml line 13096)

**Historical Context:**
- Multiple bugs related to date range filtering (lines 51632, 51740, 51750, 51789, 52859, 52899)
- Line 45193: "Title: Select Date instead of pick date range" - design discussion
- Line 46393: "days shouldn't be clickable because they are just the days being shown. but date range should be clickable"

---

### BUG-008: Handover process - user can only include or skip an expense, but not reject

**Preconditions:**
- Manager is performing cash handover process
- There are pending expenses to review
- Manager has permission to approve/reject expenses

**Reproduction Steps:**
1. Navigate to Cash Handover module
2. Start handover process with pending expenses
3. Review an expense item
4. Look for available actions (Include, Skip, Reject)

**Actual Behaviour:**
- Only two options: "Include" (approve) or "Skip" (ignore)
- **No "Reject" option** to explicitly deny an expense with reason
- Skipped expenses are not tracked as rejected

**Expected Behaviour:**
- Three options should be available:
  1. **Include** - Approve and add to handover
  2. **Reject** - Explicitly deny with mandatory reason/comment
  3. **Skip** - Defer decision (keep pending for later)
- Rejected expenses should be logged with reason for audit trail

**Severity:** Medium
**Priority:** High
**Component:** web-dU, manager_dU
**Labels:** CASH_HANDOVER, EXPENSE_MANAGEMENT, WORKFLOW, MISSING_FEATURE, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Cash handover/Reject expense (zephyr.xml line 26) - **TEST CASE EXISTS FOR REJECT**
- DU-TXXXX: DriveUp Admin/Web Manager/Cash handover/Skip expense (zephyr.xml line 29)
- DU-TXXXX: DriveUp Admin/Web Manager/Cash handover/Submit cash handover (zephyr.xml line 31)
- Mobile tests: "Reject expense" (zephyr_mobile.xml line 37), "Skip expense" (line 40)

**Historical Context:**
- **Test case exists for "Reject expense" (line 26)** but the feature is not implemented in UI
- Mobile also has "Reject expense" test case (line 37)
- Line 17591: "after the cash handover is submitted, the rejected expense is removed from the list" - implies reject should exist
- This is a **missing feature** despite test cases being written for it

---

### BUG-009: Handover history missing

**Preconditions:**
- Manager has completed at least one cash handover
- Manager navigates to handover history section

**Reproduction Steps:**
1. Navigate to Cash Handover module
2. Look for "History" or "Past Handovers" section
3. Attempt to view previous handover records

**Actual Behaviour:**
- No handover history section/page is accessible
- Cannot view past completed handovers
- No audit trail of previous handovers

**Expected Behaviour:**
- "Handover History" section should be available
- List of all past handovers with date, amount, instructor, status
- Ability to click and view details of each historical handover
- Export/filter capabilities

**Severity:** Medium
**Priority:** Medium
**Component:** web-dU, manager_dU
**Labels:** CASH_HANDOVER, HISTORY, AUDIT_TRAIL, MISSING_FEATURE, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Cash handover/View handover history (zephyr.xml line 32) - **TEST CASE EXISTS**
- DU-TXXXX: Mobile test "User sees handover history" (zephyr_mobile.xml line 19524) - **TEST CASE EXISTS**

**Historical Context:**
- **Test case exists in both web and mobile (lines 32, 19524)** but feature not implemented
- DU-1326: "Manage your accounts wrongly displayed instead of recipient name in handover history" (line 68744) - implies history should exist
- Line 40649: DU-1659 "Cash handover history item shows wrong user in 'Received by'" - confirms history feature was worked on

---

### BUG-010: Admin fee changed in category settings, not changed for current trainings

**Preconditions:**
- Manager has active trainings using a specific driving category
- Category has an administration fee configured
- Manager changes the admin fee in category settings

**Reproduction Steps:**
1. Create a driving category with admin fee (e.g., €50)
2. Create active trainings using this category
3. Go to Category Settings and change admin fee to €75
4. Check existing active trainings

**Actual Behaviour:**
- Existing trainings still show old admin fee (€50)
- Fee change only applies to **new** trainings created after the change
- No option to propagate change to current trainings
- Inconsistent pricing for same category

**Expected Behaviour:**
- When admin fee is changed in category settings:
  - **Option A**: Prompt user to apply to all current trainings using this category
  - **Option B**: Automatically update all active trainings (with confirmation)
  - **Option C**: Clear indication that change only affects future trainings
- At minimum, clear warning/notification about scope of change

**Severity:** Medium
**Priority:** Medium
**Component:** web-dU, manager_dU
**Labels:** FINANCIAL, ADMIN_FEE, CATEGORY_SETTINGS, DATA_CONSISTENCY, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Manage category settings/Edit category (zephyr.xml line 85)
- DU-TXXXX: DriveUp Admin/Web Manager/Financial flow/Manage payments (zephyr.xml line 68)

**Historical Context:**
- Line 49513: "Due to a mistake in the design, the financial overview shows 'administration fee'" - related to admin fee display
- Line 43844: Comment "there is no administration fee for courses" - suggests category-specific fee logic
- This is a data propagation/consistency issue

---

### BUG-011: Adding company holiday does not update the calendar - only after refresh

**Preconditions:**
- Manager is logged into DriveUp Admin
- Calendar view is open (appointments/schedule)
- Manager has permission to manage company holidays

**Reproduction Steps:**
1. Open Calendar/Appointments view
2. Navigate to Company Settings → Holidays
3. Add a new company holiday for a future date
4. Return to Calendar view (without full page refresh)
5. Observe if holiday appears on calendar

**Actual Behaviour:**
- New holiday does **not** appear on calendar immediately
- Calendar only updates after **full page refresh** (F5)
- No real-time/reactive update

**Expected Behaviour:**
- Calendar should update **immediately** after adding holiday
- Holiday should be visible on the calendar date(s) without refresh
- Reactive UI update via state management

**Severity:** Medium
**Priority:** Medium
**Component:** web-dU, manager_dU
**Labels:** CALENDAR, COMPANY_HOLIDAY, REAL_TIME_UPDATE, UI_BUG, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Manage company settings/Manage holidays (zephyr.xml line 92)
- Mobile test: "User sees pinned company holiday on top" (zephyr_mobile.xml line 13843)
- DU-1183: "Off day and company holidays not clickable in calendar" (line 72894)

**Historical Context:**
- DU-1183 exists for clickability, this is for **visibility/update**
- Mobile has test for seeing holiday, web may lack reactive update

---

### BUG-012: When company language changed in company settings, the UI language is also changed - should not affect user UI preferences

**Preconditions:**
- Manager is logged into DriveUp Admin
- Manager has personal UI language preference set (different from company language)
- Manager has permission to change company settings

**Reproduction Steps:**
1. Set personal UI language preference (e.g., English) in Account Settings
2. Set company language to different language (e.g., German) in Company Settings
3. Observe UI language change

**Actual Behaviour:**
- Changing company language **also changes** the manager's UI language
- Personal language preference is overridden
- All UI text switches to company language

**Expected Behaviour:**
- Company language should **only affect**:
  - Student-facing communications
  - Document templates (contracts, invoices)
  - Default language for new instructors/students
- Company language should **NOT affect**:
  - Logged-in user's UI language preference
  - Manager/instructor personal interface language
- User's UI language should remain as set in their Account Settings

**Severity:** Medium
**Priority:** Medium
**Component:** web-dU, manager_dU, instructor_dU
**Labels:** LANGUAGE, LOCALIZATION, USER_PREFERENCES, COMPANY_SETTINGS, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Manage company settings/Manage company language (zephyr.xml line 90)
- Mobile test: "User can change the company language" (zephyr.xml line 4910)
- Mobile test: "User language is set to company language" (zephyr_mobile.xml line 2055)

**Historical Context:**
- **DU-1411**: "Company language not persisted for newly invited instructors" (line 63562) - related but different issue
- Line 844 (mobile): "users language is automatically set to company language" - this may be the root cause
- Line 2055 (web): "user language is set to company language" - confirms the problematic behavior
- This is a **cross-layer data contract issue** (per AGENTS.md learnings) - backend puts company language in token, frontend compares against wrong ID

---

## LOW

### BUG-013: Wrong footer (only "Sign out") shown on the account settings page - updated after refresh

**Preconditions:**
- User is logged into DriveUp Admin (any role)
- User navigates to Account Settings page

**Reproduction Steps:**
1. Log in to DriveUp Admin
2. Navigate to Account Settings (via user menu or direct URL)
3. Observe the footer/bottom navigation area
4. Refresh the page (F5)
5. Observe footer again

**Actual Behaviour:**
- On initial load: Footer shows **only "Sign out"** button/link
- After refresh: Footer shows **correct full footer** (navigation, version info, links, etc.)
- Inconsistent footer rendering on initial page load

**Expected Behaviour:**
- Footer should render correctly on **initial load**
- Full footer with navigation, version, links should be visible
- No difference between initial load and refresh

**Severity:** Low
**Priority:** Low
**Component:** web-dU, manager_dU, instructor_dU, agent_dU
**Labels:** UI_BUG, FOOTER, ACCOUNT_SETTINGS, RENDERING, APPROVED

**Related Test Cases:**
- DU-TXXXX: Mobile tests for "User lands on the account settings page" (zephyr_mobile.xml lines 3680, 4453, 4507, 4535)
- DU-TXXXX: Mobile test "User can view & edit account settings" (zephyr_mobile.xml line 5264)

**Historical Context:**
- Multiple mobile test cases for account settings page
- Likely a component mounting/rendering order issue in Angular

---

### BUG-014: User can't add a custom pickup location to a training

**Preconditions:**
- Manager is creating/editing a driving training
- Company has pickup locations configured
- Manager wants to add a custom (one-time) pickup location not in company list

**Reproduction Steps:**
1. Navigate to create/edit driving training
2. Go to pickup location field/section
3. Attempt to enter a custom address not in company pickup locations list
4. Try to save

**Actual Behaviour:**
- Only allows selecting from predefined company pickup locations
- No option to "Add custom location" or enter free-text address
- Custom one-time pickup locations cannot be specified

**Expected Behaviour:**
- Should allow selecting from company pickup locations **OR**
- Enter a custom one-time pickup address
- Custom location saved for this training only (not added to company list)
- Mobile already supports this (see test cases)

**Severity:** Low
**Priority:** Medium
**Component:** web-dU, manager_dU, student_dU
**Labels:** PICKUP_LOCATION, TRAINING, CUSTOM_INPUT, MISSING_FEATURE, APPROVED

**Related Test Cases:**
- DU-TXXXX: DriveUp Admin/Web Manager/Manage company settings/Add+Edit pickup locations (zephyr.xml line 88)
- **Mobile has extensive test coverage for custom pickup locations:**
  - "User can add custom pickup location" (zephyr_mobile.xml line 11892)
  - "User can add a custom pickup location" (line 14573)
  - "User can edit custom pickup location" (line 12283)
  - "User can select another pickup location" (line 12253)
- DU-2183: "Company pickup location can't be added" (line 961) - **EXISTING BUG** for company-level, this is training-level

**Historical Context:**
- **DU-2183 exists** for adding company pickup locations (High priority, APPROVED)
- Mobile already implements custom pickup locations for training/appointments
- Web admin is missing this feature parity
- This is a **feature gap** between mobile and web

---

## Summary: Bug Severity Order

| Priority | Bug ID | Title | Component |
|----------|--------|-------|-----------|
| **Critical** | BUG-001 | Downloading any document logs out the user | web-dU, manager_dU |
| **High** | BUG-002 | Invited instructor sees empty info page at end of onboarding | web-dU, manager_dU, instructor_dU |
| **High** | BUG-003 | Admin fee toggle wrong logic (label + default state) | web-dU, manager_dU |
| **High** | BUG-004 | Reference number behaves as mandatory field | web-dU, manager_dU, student_dU |
| **High** | BUG-005 | Reinstate button missing for completed/terminated training | web-dU, manager_dU |
| **Medium** | BUG-006 | Course overview calendar must be hidden until Pro | web-dU, manager_dU |
| **Medium** | BUG-007 | Finance overview date range field too narrow | web-dU, manager_dU |
| **Medium** | BUG-008 | Handover process missing reject option | web-dU, manager_dU |
| **Medium** | BUG-009 | Handover history missing | web-dU, manager_dU |
| **Medium** | BUG-010 | Admin fee change not propagated to current trainings | web-dU, manager_dU |
| **Medium** | BUG-011 | Company holiday doesn't update calendar without refresh | web-dU, manager_dU |
| **Medium** | BUG-012 | Company language changes UI language (should not) | web-dU, manager_dU, instructor_dU |
| **Low** | BUG-013 | Wrong footer on account settings page | web-dU, all roles |
| **Low** | BUG-014 | Can't add custom pickup location to training | web-dU, manager_dU, student_dU |

---

## Existing Bugs in Database (Potential Duplicates/Related)

| Existing Bug | Title | Status | Related to |
|--------------|-------|--------|------------|
| DU-2183 | Company pickup location can't be added | To Do (High) | BUG-014 (company level) |
| DU-901 | Correct label not shown for empty admin fee | - | BUG-003 (label issue) |
| DU-731 | 0.00 added automatically for admin fee | - | BUG-003 (related) |
| DU-1411 | Company language not persisted for invited instructors | - | BUG-012 (related) |
| DU-1326 | Wrong user in handover history | - | BUG-009 (history exists?) |
| DU-1183 | Off day/holidays not clickable in calendar | - | BUG-011 (visibility) |
| DU-1039 | Can add appointments for terminated trainings | - | BUG-005 (related workflow) |
| DU-2182 | Recovery email not shown in account settings | To Do (Highest) | BUG-013 (same page) |

---

## Test Case Mapping Gaps

**Test cases EXIST but features MISSING:**
- Cash handover "Reject expense" (web line 26, mobile line 37) → BUG-008
- Cash handover "View handover history" (web line 32, mobile line 19524) → BUG-009
- Mobile custom pickup locations (multiple test cases) → BUG-014 (web missing)

**Test cases NEED CREATION:**
- Document download session persistence → BUG-001
- Invited instructor onboarding empty info page → BUG-002
- Admin fee toggle default state/logic → BUG-003
- License reference number optional validation → BUG-004
- Training reinstate workflow → BUG-005
- Pro feature gating for course calendar → BUG-006
- Finance date range picker UI → BUG-007
- Admin fee propagation to trainings → BUG-010
- Company holiday reactive calendar update → BUG-011
- Company language vs user UI language separation → BUG-012
- Account settings footer rendering → BUG-013