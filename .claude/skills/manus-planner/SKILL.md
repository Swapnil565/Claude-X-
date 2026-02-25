---
name: manus-planner
description: Activates the Manus AI planning-with-files architecture for any long or complex task. Creates persistent task_plan.md, findings.md, and progress.md. Use at the START of any multi-phase project or research task.
---

# MANUS PLANNER — ACTIVATE PERSISTENT MEMORY

You are now operating under the Manus AI planning-with-files architecture.

## Core Principle
Context window = RAM (volatile, gets compacted, disappears)
Filesystem = Disk (persistent, survives resets, accumulates)

**Write everything important to disk. Immediately.**

## Initialize the Three Files

### 1. task_plan.md
Create with this structure:
```markdown
# Task Plan: [TASK NAME]
Created: [date]
Status: IN PROGRESS

## Objective
[One clear sentence: what success looks like]

## Phases
### Phase 1: [Name] — STATUS: TODO
- [ ] Step 1.1: ...
- [ ] Step 1.2: ...

### Phase 2: [Name] — STATUS: TODO
- [ ] Step 2.1: ...

## Constraints
- [Any important limits or rules]

## Definition of Done
- [ ] Criterion 1
- [ ] Criterion 2
```

### 2. findings.md
Create with this structure:
```markdown
# Findings Log
Created: [date]

## Session [date] Discoveries
### Finding 1: [Title]
- What: ...
- Source: ...
- Confidence: HIGH / MEDIUM / LOW
- Implication: ...
```

### 3. progress.md
Create with this structure:
```markdown
# Progress Log
Created: [date]

## [date] Session Start
- Goal: ...
- Context loaded from: task_plan.md, findings.md

## Actions Taken
- ...

## Session End
- Completed: ...
- Blocked by: ...
- Next session should start with: ...
```

## The 2-Action Rule
After every 2 tool calls (read/fetch/search/write):
→ STOP and write any new findings to `findings.md`
→ This prevents information loss during compaction

## Phase Completion Rule
When all steps in a phase are ✅:
→ Mark phase as STATUS: DONE in task_plan.md
→ Write summary to progress.md
→ Only then proceed to next phase

## Session Resumption
At the start of ANY session on this project:
1. Read task_plan.md first
2. Read findings.md for context
3. Read progress.md for where you left off
4. Continue from the first incomplete step

## Anti-Stop Hook
DO NOT stop or consider the task complete until:
- All phases in task_plan.md show STATUS: DONE
- Definition of Done checklist is fully checked

The task is ONGOING until the filesystem says it's done.
