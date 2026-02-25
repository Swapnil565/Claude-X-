---
name: context-guardian
description: Context window management skill. Activates automatically when context is high. Guides strategic compaction, session teleportation, and context recovery after resets.
---

# CONTEXT GUARDIAN

Your context window is 200K tokens. Quality degrades past 70%. Compaction happens automatically at 95% — but by then you've already lost quality. Be proactive.

## Context Health Checks
Run `/context` to see current usage. Act based on these thresholds:

| Usage | Action |
|-------|--------|
| <50%  | All good. Continue. |
| 50-65%| Start wrapping up current task. |
| 65%   | COMPACT NOW at next logical breakpoint. |
| 80%+  | COMPACT IMMEDIATELY. Quality is degrading. |
| 95%+  | Auto-compaction triggered. Recovery needed. |

## Strategic Compaction Checklist
Before running `/compact`, do this:
1. Save current state to files:
   ```
   Write progress.md — what's been done
   Write findings.md — key discoveries
   Write task_plan.md — where you are in the plan
   ```
2. Note the EXACT next step in task_plan.md
3. Then run `/compact`

## Post-Compaction Recovery
After compaction (context was reset), DO THIS FIRST:
1. Read `CLAUDE.md` — reload your identity and rules
2. Read `task_plan.md` — find where you are
3. Read `findings.md` — reload context
4. Read `progress.md` — understand session history
5. Announce: "Context recovered. Continuing from [STEP]."

## Session Teleportation
To continue a task in a NEW session:
```bash
# In new terminal
claude --resume  # Pick the session from the list
```
Or use `/resume` inside Claude Code to switch sessions.
Sessions are stored per project directory.
Give sessions descriptive names: `/resume` → R to rename.

## Warning Signs of Context Rot
If you notice any of these, compact immediately:
- Forgetting instructions from earlier in the session
- Repeating work already done
- Ignoring rules from CLAUDE.md
- Degraded code quality compared to session start
