---
name: project-init
description: Interactive project initialization. Run ONCE when starting a new project with cc-steroids. Walks through all setup questions and writes the Project DNA to CLAUDE.md, creates task_plan.md, decisions.md, and findings.md. Replaces the placeholder comments in CLAUDE.md.
disable-model-invocation: false
---

# PROJECT INIT — FIRST-TIME SETUP

You are setting up a new project with cc-steroids. Go through these questions ONE AT A TIME. Wait for the answer before asking the next one. Do not ask more than one question per response.

After collecting all answers, do the following:

1. **Update CLAUDE.md** — Fill in the Project DNA section with everything collected
2. **Create task_plan.md** — Initialize with the project name and first phase
3. **Create decisions.md** — Initialize with a single entry: "Chose cc-steroids as Claude Code configuration"
4. **Create findings.md** — Initialize with project context
5. **Create progress.md** — Initialize with today's date and "Project initialized"

---

## Questions to ask (one at a time):

1. "What is this project? Give me a one-sentence description."

2. "What's the tech stack? (e.g. Next.js 14 + TypeScript + Postgres, or FastAPI + Python 3.12 + SQLite)"

3. "What's your test runner? (jest, vitest, pytest, etc.) And do tests currently pass?"

4. "Where does this deploy? (Vercel, AWS, Docker, local only, etc.)"

5. "Are there any files or directories that should NEVER be touched without explicit permission? (e.g. database migrations, auth config)"

6. "Are there patterns you hate and never want to see? (e.g. 'never use any, never use class components, always use async/await not .then()'"

7. "What does 'done' mean for this project? List the things that must be true before any feature is considered complete."

8. "Is there anything about this codebase I should know that isn't obvious from the code? (Gotchas, workarounds, historical decisions)"

---

## After collecting answers, produce:

### CLAUDE.md Project DNA section (replace the placeholder):
```markdown
## 📁 PROJECT DNA

- **Project:** [name + one-line description]
- **Stack:** [full stack]
- **Test runner:** [runner] | Tests passing: [yes/no]
- **Deploy target:** [target]
- **Sacred files:** [list or "none specified"]
- **Forbidden patterns:** [list or "none specified"]
- **Definition of Done:**
  - [ ] [criterion 1]
  - [ ] [criterion 2]
- **Gotchas:** [anything unusual]
```

### task_plan.md:
```markdown
# Task Plan: [PROJECT NAME]
## MISSION LOCK
> [One sentence: what success looks like for this project]

## Status: ACTIVE
Initialized: [date]

## Phase 1: [First logical phase]
- [ ] [First step]

## Decisions Log → See decisions.md
## Findings Log → See findings.md
```

### decisions.md:
```markdown
# Decision Log — [PROJECT NAME]

## [DATE] — Adopted cc-steroids configuration
- **Context:** Setting up Claude Code for this project
- **Chose:** cc-steroids v2.0 configuration
- **Because:** Provides structured workflow, memory, agents, and safety hooks
- **Revisit if:** Project outgrows the current agent setup
```

---

When done: "Project initialized. CLAUDE.md updated, task_plan.md created, decisions.md created. You're ready. Start your first task with `/risk-check` or just describe what you want to build."
