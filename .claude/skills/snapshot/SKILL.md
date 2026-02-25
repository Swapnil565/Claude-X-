---
name: snapshot
description: Creates a structured state snapshot before any risky operation, or after getting unstuck. Makes context resets non-fatal — paste the output into a new session and resume perfectly. Use before YOLO mode, before major refactors, or whenever you want a recovery point.
---

# SNAPSHOT — STATE PRESERVATION

Create a complete state snapshot right now. This captures everything needed to resume perfectly in a new session or after a context reset.

Fill in each field honestly. Empty fields are fine — a partial snapshot is better than none.

---

```
## SNAPSHOT — [timestamp]

### MISSION
> [The exact original goal. One sentence. Copy from task_plan.md if it exists.]

### WHAT WE'VE ACCOMPLISHED
- [Specific verifiable things completed, with file names]
- [Test results if any]

### CURRENT STATE OF THE SYSTEM
- Working: [what definitely works right now]
- Broken: [what is currently broken or incomplete]
- Half-finished: [work in progress that touches multiple files]

### APPROACHES TRIED (and why they failed)
1. [Approach] → Failed because: [reason]
2. [Approach] → Failed because: [reason]

### VERIFIED FACTS (high confidence)
- [Things we know to be true, confirmed by tests or direct observation]

### UNVERIFIED ASSUMPTIONS (check these)
- [Things we're assuming but haven't confirmed]
- [This is where most bugs hide]

### THE ONE THING THAT MUST HAPPEN NEXT
> [Single specific next action. Specific enough that cold-start Claude executes it without asking clarifying questions.]

### ACTIVE RISKS
- [Anything that might surprise the next session]
- [Half-finished work that could cause problems]
- [State that looks complete but isn't]

### ROLLBACK INSTRUCTIONS
> [Exactly how to undo everything since the last git checkpoint, if needed]
> git log --oneline -5 to find checkpoint, then: git reset --hard [hash]

### DON'T FORGET
- [Important context that isn't written in any file]
- [The thing you'll forget and then spend 20 minutes re-learning]
```

---

After creating this snapshot:
1. Save it to `snapshot_[timestamp].md`
2. If starting a new session: paste this into the first message
3. If resuming after compaction: read this file first before anything else

The snapshot is your parachute. Write it before you need it.
