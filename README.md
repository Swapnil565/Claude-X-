# ⚡ CC-STEROIDS
### The Most Powerful Claude Code Setup — One Command Install

Transform Claude Code from a chat assistant into an autonomous, memory-persistent, multi-agent powerhouse.

---

## ⚡ One-Command Install

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_HANDLE/cc-steroids/main/install.sh | bash
```

That's it. The installer:
- ✅ Backs up your existing config
- ✅ Installs CLAUDE.md (master configuration)
- ✅ Enables Agent Teams + 4 auto-running hooks
- ✅ Installs 6 specialized agents
- ✅ Installs 5 power skills
- ✅ Optionally installs recommended MCPs

---

## What You Get

### 🤖 6 Specialized Agents

| Agent | Use When |
|-------|----------|
| `security-reviewer` | Before any production deploy. Finds vulns, auth issues, injection risks. |
| `codebase-explorer` | Starting a new session. Maps architecture read-only before touching anything. |
| `deep-researcher` | Research tasks. Manus AI architecture — writes findings to disk every 2 actions. |
| `architect-planner` | Before implementing anything significant. Creates ADRs and task breakdowns. |
| `code-reviewer` | Before merging any PR. Reviews correctness, performance, security, style. |
| `debug-team` | Hard bugs that resist normal debugging. Generates 3 competing hypotheses. |

**How to use:**
```
"Use the codebase-explorer agent to map this repo"
"Use the architect-planner agent to design the auth system"
"Use the debug-team agent for this intermittent 500 error"
```

### 🛠️ 5 Power Skills (slash commands)

| Skill | What It Does |
|-------|-------------|
| `/manus-planner` | Activates Manus AI planning-with-files. Creates task_plan.md + findings.md + progress.md. Survives context resets. |
| `/risk-check` | Pre-task risk enumeration. Lists failure modes BEFORE implementing. |
| `/git-discipline` | Conventional commits, branch naming, PR templates. |
| `/spawn-team` | Templates for Agent Teams — parallel workers that communicate. |
| `/context-guardian` | Context health management. When to compact, how to recover after resets. |

### 🪝 4 Always-Running Hooks

| Hook | Trigger | What It Does |
|------|---------|-------------|
| Auto-format | After every file write | Runs prettier. Zero style debates. |
| Auto-test | After every file write | Runs your test suite. Claude sees failures and fixes them. |
| Safety guard | Before every bash command | Blocks `rm -rf /`, `git reset --hard`, and other destructive commands. |
| Auto-commit | After every response | Creates a git checkpoint. Never lose work. |

### ⚙️ Settings

- **Agent Teams enabled** (`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`)
- **Extended thinking** configured (`MAX_THINKING_TOKENS=10000`)
- **Strategic compaction** at 65% context (`CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=65`)

---

## The Philosophy

Most people use Claude Code like a smarter autocomplete. This kit treats it as what it actually is: **a general intelligence agent that can run autonomously, remember everything, and coordinate teams**.

The gap between default Claude Code and this setup isn't 2x or 5x. It's categorical.

### The Four Principles

1. **Permanent Memory** — Claude remembers every decision, finding, and fix across sessions using planning-with-files + memory MCP
2. **Parallel Execution** — Agent Teams and worktrees let multiple specialists work simultaneously  
3. **Deterministic Quality** — Hooks enforce formatting, testing, and safety AUTOMATICALLY — not probabilistically
4. **Compounding Value** — The system gets smarter every week. Month 6 is 10x month 1.

---

## Recommended MCPs (Optional)

The installer offers to set these up. Or add them manually:

```bash
# Live API documentation (eliminates hallucinated API calls)
claude mcp add context7 -- npx -y @upstash/context7-mcp

# Browser automation (scraping, testing, web workflows)
npm install -g @playwright/mcp
claude mcp add playwright -- npx @playwright/mcp

# Persistent knowledge graph memory
claude mcp add memory -- npx -y @modelcontextprotocol/server-memory

# GitHub (PR creation, issue management, CI/CD)
claude mcp add github -- npx @modelcontextprotocol/server-github
```

For production scraping: [Bright Data MCP](https://brightdata.com/products/mcp) (5k free calls/month)  
For financial data: [Financial Modeling Prep MCP](https://financialmodelingprep.com/mcp)

---

## Quick Start Guide

### Day 1: Basic Usage

```bash
# Start Claude Code
claude

# Map a new codebase before touching it
"Use the codebase-explorer agent to understand this project"

# Before implementing anything
"Use the architect-planner agent to design [feature]"
```

### Day 2: Long Projects (Manus Architecture)

```bash
# Start any multi-day project
/manus-planner

# Claude creates task_plan.md, findings.md, progress.md
# These survive context resets and session boundaries
# Next session: Claude reads them and continues from where it left off
```

### Day 3: Agent Teams (Parallel Work)

```bash
# Enable (already in settings.json from install)
# Just ask in natural language:
"Create an agent team to review this PR. 
 Spawn three reviewers: security, performance, and test coverage."
```

### Week 2: Full Power

```bash
# Run risky tasks safely (Docker recommended)
git commit -am "checkpoint" && claude --dangerously-skip-permissions

# Parallel feature development
claude --worktree feature-auth
claude --worktree feature-payments  # Different terminal

# Research anything
"Use the deep-researcher agent to investigate [topic]"
```

---

## For Non-Coders

You don't need to write code to use this. Try:

- **Voice input**: Use SuperWhisper to dictate sessions
- **Start in Plan Mode**: Press `Shift+Tab` twice — Claude plans without executing
- **Use MCPs**: Ask Claude to search the web, manage files, send emails

Non-coding use cases that work out-of-the-box:
- Legal contract analysis ("Review these 50 contracts for uncapped liability clauses")
- Research reports ("Deep-research quantum computing market size")
- Business documents ("Write a PRD from this voice memo")
- Personal health tracking (upload labs, ask for trend analysis)

---

## Troubleshooting

**Hooks not running?**
```bash
# In Claude Code, check hooks are loaded
/hooks
# Should show: PostToolUse (Write|Edit), PreToolUse (Bash), Stop
```

**Agent Teams not working?**
```bash
# Check env var is set
cat ~/.claude/settings.json | grep AGENT_TEAMS
# Should show: "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
```

**Context compacting too early?**
```bash
# Check the override is set
cat ~/.claude/settings.json | grep AUTOCOMPACT
# Should show: "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "65"
```

**Rate limits hitting?**
- Switch to API key mode: `export ANTHROPIC_API_KEY=your_key`
- Use Sonnet for 90% of tasks, Opus only for complex work

---

## What's Not Included (Do These Manually)

These require API keys or external accounts:
- **Firecrawl MCP** (web scraping) — get key at firecrawl.dev
- **Bright Data MCP** (enterprise scraping) — brightdata.com  
- **Perplexity MCP** (research search) — perplexity.ai/api
- **claude-mem** (full episodic memory) — github.com/thedotmack/claude-mem
- **Total Recall** (long-term memory) — github.com/davegoldblatt/total-recall
- **claude-flow** (swarm orchestration) — github.com/ruvnet/claude-flow

---

## Uninstall

```bash
# Your original config was backed up during install to:
# ~/.cc-steroids-backup-[timestamp]/

# To restore:
cp -r ~/.cc-steroids-backup-[timestamp]/* ~/.claude/
cp ~/.cc-steroids-backup-[timestamp]/CLAUDE.md ~/CLAUDE.md
```

---

## Contributing

Found a better agent definition? A hook that makes life easier?  
PRs welcome. This is a community kit.

---

*Built from research across GitHub, Reddit, HackerNews, Medium, and Anthropic Docs — February 2026*
