# Phone Validation: Invite Team Member — Cross-Platform Review Findings

**Date:** 2026-08-22  
**Scope:** Invite team member flow (company owner/manager inviting an instructor)  
**Projects compared:** \driveup-admin\ (Admin UI), \driveup-api\ (Backend), \driveup-mobile\ (Mobile App)  
**Related specs:** Gherkin features under \docs/kb/features/Mobile/Company/\ (no specific invite-team-member feature found)

---

## 1. Cross-Platform Comparison Summary

| Aspect | Admin UI (\driveup-admin\) | API (\driveup-api\) | Mobile (\driveup-mobile\) |
|--------|---------------------------|---------------------|---------------------------|
| **Entry point** | \CompanyTeamComponent\ → drawer → invite form | \POST /company/team\ (\CompanyTeamController.invite()\) | No dedicated team-invite UI (team management is Admin-only) |
| **Phone input field** | Reactive form \FormControl\ with \phoneValidator\ | Raw string in \InstructorInviteDto.phone\ | \PhoneNumberField\ widget (shared) |
| **Country code source** | \UserFacade.country().phoneCode\ (reactive signal) | \company.country.phoneCode\ (from authenticated company) | \CountriesBloc\ → selected country's \phoneCode\ |
| **Normalization** | \PhoneNumber.normalize()\ / \PhoneNumber.tryToE164()\ | None (validates \startsWith(country.phoneCode)\ only) | \PhoneNumberField.stripNumber()\ + \FilteringTextInputFormatter.digitsOnly\ |
| **Validation rules** | 1. \phoneValidator\: national number ≥ \minDigits\ (9) AND \isValid()\<br>2. On submit: \digits.length ≥ 9\ AND \	ryToE164() ≠ null\ | 1. \dto.phone.startsWith(country.phoneCode)\ (line 222)<br>2. Role ∈ {Manager, Instructor}<br>3. No duplicate in company (unless closed+reinstatable) | 1. Required check<br>2. \al.length < 9\ → "Invalid phone number" |
| **Error messages** | \page.company.team.invite.error.phoneNumberInvalid\ (with \{length: 9}\) | \ErrorMessage.student.phoneNumberNotFromSameCountry\ (403) | \invalidPhoneNumberError\ (localized) |
| **Min digits enforced** | 9 (invite form), 7 (\PhoneNumber.toE164\ internal) | Implicit: country code + at least 1 digit | 9 characters total (including country code prefix shown in UI) |
