---
name: maestro
description: Maestro E2E UI testing conventions for the DriveUp monorepo. Use when writing, running, or debugging Maestro flows in driveup-mobile.
---

# Maestro

Maestro is the E2E UI test framework for the DriveUp mobile app.

## Layout
- Flows: `driveup-mobile/.maestro/<area>/<name>.yaml`
- App ID: `com.intelact.driveup`
- Run from the repo root or `driveup-mobile/`.

## Flow anatomy

```yaml
appId: com.intelact.driveup
---
- launchApp
- tapOn: "Login"
- inputText: "test@example.com"
- assertVisible: "Welcome"
```

## Commands
- Run one flow: `maestro test driveup-mobile/.maestro/auth/test1.yaml`
- Debug with artifacts: `maestro test --debug-output driveup-mobile/.maestro/out driveup-mobile/.maestro/auth/test1.yaml`
- Reference: `maestro --help`

## Best practices
- Use text or `id:` selectors from the accessibility hierarchy, never raw coordinates.
- Start flows with `- launchApp` and `- clearState` when isolation is needed.
- Emulator networking: use `10.0.2.2` instead of `localhost` for the local API.
- One scenario per flow; keep flows short and deterministic.
