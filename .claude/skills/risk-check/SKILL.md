---
name: risk-check
description: Pre-task risk assessment skill. Automatically activates before any implementation to enumerate failure modes. Encodes the "imagine failure first" discipline that LLMs lack by default.
---

# RISK CHECK — PRE-TASK ASSESSMENT

Before implementing anything, answer these questions. This takes 2 minutes and saves hours.

## 1. Blast Radius
If this goes wrong, what breaks?
- Worst case: ...
- Likely case: ...
- Who is affected: ...

## 2. Irreversibility
Can this be undone?
- [ ] Fully reversible (changes are local, can revert)
- [ ] Partially reversible (some data loss possible)
- [ ] Irreversible (deletes data, sends emails, charges money)

If IRREVERSIBLE: Create a checkpoint NOW before proceeding.
```bash
git commit -am "checkpoint before [TASK_NAME]"
```

## 3. Five Failure Modes
List 5 things that could go wrong with the proposed approach:
1. ...
2. ...
3. ...
4. ...
5. ...

## 4. Mitigation Plan
For each High-severity risk: what's the mitigation?

## 5. Go/No-Go
Based on this assessment:
- [ ] PROCEED — risks are acceptable and mitigated
- [ ] PAUSE — need more information before proceeding
- [ ] ESCALATE — this needs human review first

---

After completing this assessment, present it to the human for approval.
Then and ONLY then, begin implementation.
