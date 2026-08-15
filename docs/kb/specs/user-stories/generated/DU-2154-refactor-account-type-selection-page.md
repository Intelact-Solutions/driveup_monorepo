# Refactor account type selection page

- **Jira:** [DU-2154](https://intelact.atlassian.net/browse/DU-2154)
- **Platform:** 📱 Mobile
- **Component:** manager_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-36
- **Coverage:** N/A – prose/technical story without scenarios

> Refactor account type selection page

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

In order to simplify the selection of the correct account type and avoid misselection, we need to refactor the account type selection page.
Changes to UI:
- Remove card for marketing agent and redesign it as a text with a hyperlink at the bottom of the screen.
- Text:
- de: Wenn du neue Nutzer für DriveUp werben und dadurch profitieren willst, kannst du ein Konto als Marketingagent erstellen.
- fr: Si tu souhaites parrainer de nouveaux utilisateurs pour DriveUp et en profiter, tu peux créer un compte d'agent marketing.
- it: Se vuoi presentare nuovi utenti per DriveUp e trarne profitto, puoi creare un account come agente di marketing.
- en: If you want to recruit new users for DriveUp and profit from it, you can create a marketing agent account.
- Update description text for driving school card:
- de: Du bist Inhaber oder Manager einer Fahrschule? Hier kannst du ein Konto für deine Fahrschule erstellen.
- fr: Tu es propriétaire ou gérant d'une auto-école ? Ici, tu peux créer un compte pour ton auto-école.
- it: Sei il proprietario o il gestore di un'autoscuola? Qui puoi creare un account per la tua scuola guida.
- en: Are you the owner or manager of a driving school? Here you can create an account for your driving school.
- Stretch the card for driving student, so that the screen has only 2 cards.
- Add description:
- de: Du willst das Fahren lernen? Hier bist du richtig.
- fr: Tu veux apprendre à conduire ? Tu es au bon endroit.
- it: Vuoi imparare a guidare? Sei nel posto giusto.
- (Optional) If there are space constraints, maybe “log out” button can be moved to another position.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
