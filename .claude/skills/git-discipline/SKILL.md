---
name: git-discipline
description: Enforces professional git workflow. Use for any commit, PR, or branch operation. Provides commit message formatting, branch naming conventions, and PR checklist.
---

# GIT DISCIPLINE SKILL

## Commit Message Format (Conventional Commits)
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

Types:
- `feat`: new feature
- `fix`: bug fix
- `docs`: documentation only
- `style`: formatting, no logic change
- `refactor`: code restructure, no behavior change
- `test`: adding/updating tests
- `chore`: build, deps, tooling
- `perf`: performance improvement
- `security`: security fix

Examples:
```
feat(auth): add JWT refresh token rotation
fix(api): handle null user in /profile endpoint
chore(deps): upgrade express to 4.18.2
```

## Branch Naming
```
feature/[ticket-id]-short-description
fix/[ticket-id]-short-description
hotfix/[ticket-id]-short-description
chore/[description]
```

## Pre-Commit Checklist
Before committing:
- [ ] Tests pass (`npm test` or `pytest` or equivalent)
- [ ] No debug console.log or print statements
- [ ] No hardcoded secrets or credentials
- [ ] No commented-out code (unless with TODO explanation)
- [ ] Commit message follows Conventional Commits format

## PR Description Template
```markdown
## Summary
[1-2 sentence summary of what this PR does]

## Changes
- [Specific change 1]
- [Specific change 2]

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing performed
- [Description of how you tested]

## Screenshots (if UI changes)

## Breaking Changes
None / [Description of breaking changes]
```

## Checkpoint Protocol
Before any YOLO/autonomous session:
```bash
git add -A && git commit -m "checkpoint: before autonomous session $(date +%Y%m%d-%H%M%S)"
```
