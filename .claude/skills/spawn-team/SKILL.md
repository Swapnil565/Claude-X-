---
name: spawn-team
description: Activates and orchestrates Claude Code Agent Teams for complex multi-workstream tasks. Provides templates for the most common team configurations. Use when a task clearly needs 3+ independent workers that need to coordinate.
---

# AGENT TEAMS — SPAWN COORDINATOR

Agent Teams are enabled in this setup (CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1).
Each teammate is a full Claude Code session with its own context window.
Teammates can message each other directly — not just report back to lead.

## When to Use Teams vs Subagents

Use **AGENT TEAMS** when:
- Task has 3+ parallel workstreams
- Workers need to share findings mid-task
- Workers need to challenge each other's conclusions
- You want competitive hypothesis testing

Use **SUBAGENTS** when:
- Quick focused task, result just needs to be returned
- Workers don't need to communicate with each other
- Simpler and 3-4x cheaper per task

## Team Templates

### 🔍 Codebase Audit Team
```
Create an agent team to audit this codebase. Spawn three teammates:
- security-reviewer: focus on vulnerabilities and auth issues
- performance-analyst: profile bottlenecks and inefficient queries  
- test-coverage: map what's tested and what's not
Have them share findings and produce a unified risk report.
```

### 🐛 Debugging Team (Competing Hypotheses)
```
Create a debugging team for [BUG DESCRIPTION]. 
Spawn three teammates with competing theories:
- hypothesis-a: investigate [THEORY 1]
- hypothesis-b: investigate [THEORY 2]
- hypothesis-c: investigate [THEORY 3]
Have them share evidence and converge on the correct explanation.
```

### 🏗️ Feature Build Team
```
Create an agent team to build [FEATURE].
Spawn three teammates:
- backend-builder: implement the API layer in [path]
- frontend-builder: build the UI components in [path]
- test-writer: write tests for what the others build
They should coordinate on the API contract.
```

### 📊 Research Team
```
Create a research team on [TOPIC].
Spawn three teammates:
- technical-researcher: investigate [technical angle]
- market-researcher: investigate [market/business angle]
- devils-advocate: challenge findings from the other two
Synthesize into a final report.
```

## Coordination Tips
- Lead: use Shift+Tab to restrict yourself to coordination-only mode
- Navigate teammates: Shift+Down to cycle through sessions
- Each teammate needs explicit context — they don't inherit your history
- Use `task list` to see shared task board status
- Cost: ~3-5x single session. Budget accordingly.

## Token Optimization
```json
// In settings.json — use Sonnet for teammates, Opus only for lead
{ "env": { "CLAUDE_CODE_SUBAGENT_MODEL": "sonnet" } }
```
