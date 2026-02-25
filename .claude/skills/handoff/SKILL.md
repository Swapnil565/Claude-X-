---
name: handoff
description: Creates a structured session handoff when ending a multi-day project or before a long break. The output is specific enough that a cold-start Claude (or another developer) can pick up exactly where you left off without asking any questions.
---

# SESSION HANDOFF

Generate a complete handoff document for this session. Be brutally specific — vague handoffs are useless.

---

```
## HANDOFF — [timestamp]
## Project: [project name]

---

### WHAT WE ACCOMPLISHED THIS SESSION
(specific and verifiable — include file names, test results, PR numbers)
- [ ] [thing 1]
- [ ] [thing 2]

### EXACT CURRENT STATE
Files modified this session:
- [file path] — [what changed and its current state]
- [file path] — [what changed and its current state]

Last test run result:
- [pass/fail, which tests, timestamp]

Half-finished work (danger zone — don't ignore these):
- [Description of anything that was started but not completed]
- [Which files are in a transitional state]

### THE ONE THING THAT MUST HAPPEN FIRST NEXT SESSION
> [Single sentence. Specific file, specific action, specific expected outcome.]
> Example: "Run `npm test` first — last run had 2 failures in auth.test.ts that need fixing before anything else."

### ACTIVE RISKS TO WATCH FOR
- [Risk 1 — why it matters]
- [Risk 2 — why it matters]

### DECISIONS MADE THIS SESSION
(things that aren't obvious from the code)
- Chose [X] over [Y] because [reason]

### CONTEXT THAT ISN'T IN ANY FILE
- [The thing you'll forget by tomorrow]
- [The workaround you found that isn't documented]
- [The person you need to talk to or the thing you need to check]

### DEFINITION OF DONE FOR THIS PHASE
- [ ] [criterion 1]
- [ ] [criterion 2]
Phase is NOT done until all boxes are checked.

---
Handoff created: [timestamp]
Next session: Read this file FIRST before touching anything.
```

---

Save this to `handoff_[date].md` in the project root.
Update `progress.md` with a one-line summary of the session.
Commit everything with: `git commit -am "wip: handoff [date]"`
