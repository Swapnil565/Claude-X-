#!/bin/bash
# ⚡ CC-STEROIDS INSTALLER
# The most powerful Claude Code setup, installed in one command.
# github.com/YOUR_HANDLE/cc-steroids

set -e

# ═══════════════════════════════════════════
# COLORS & FORMATTING
# ═══════════════════════════════════════════
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

print_banner() {
  echo ""
  echo -e "${CYAN}${BOLD}"
  echo "  ██████╗ ██████╗    ███████╗████████╗███████╗██████╗  ██████╗ ██╗██████╗ ███████╗"
  echo " ██╔════╝██╔════╝    ██╔════╝╚══██╔══╝██╔════╝██╔══██╗██╔═══██╗██║██╔══██╗██╔════╝"
  echo " ██║     ██║         ███████╗   ██║   █████╗  ██████╔╝██║   ██║██║██║  ██║███████╗"
  echo " ██║     ██║         ╚════██║   ██║   ██╔══╝  ██╔══██╗██║   ██║██║██║  ██║╚════██║"
  echo " ╚██████╗╚██████╗    ███████║   ██║   ███████╗██║  ██║╚██████╔╝██║██████╔╝███████║"
  echo "  ╚═════╝ ╚═════╝    ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═════╝ ╚══════╝"
  echo -e "${RESET}"
  echo -e "${BOLD}  ⚡ The Most Powerful Claude Code Setup — One Command Install${RESET}"
  echo -e "${GRAY}  Version 1.0 | February 2026${RESET}"
  echo ""
}

step() {
  echo -e "\n${BLUE}${BOLD}▶ $1${RESET}"
}

ok() {
  echo -e "  ${GREEN}✅ $1${RESET}"
}

warn() {
  echo -e "  ${YELLOW}⚠️  $1${RESET}"
}

info() {
  echo -e "  ${CYAN}ℹ️  $1${RESET}"
}

# ═══════════════════════════════════════════
# CHECK PREREQUISITES
# ═══════════════════════════════════════════
print_banner

step "Checking prerequisites..."

# Check Claude Code is installed
if ! command -v claude &>/dev/null; then
  echo -e "\n${RED}${BOLD}❌ Claude Code is not installed.${RESET}"
  echo ""
  echo "Install it first:"
  echo -e "  ${CYAN}npm install -g @anthropic-ai/claude-code${RESET}"
  echo ""
  echo "Then run this installer again."
  exit 1
fi

CLAUDE_VERSION=$(claude --version 2>/dev/null | head -1 || echo "unknown")
ok "Claude Code found: $CLAUDE_VERSION"

# Check git
if ! command -v git &>/dev/null; then
  warn "git not found — auto-commit hook will be disabled"
  GIT_AVAILABLE=false
else
  ok "git found"
  GIT_AVAILABLE=true
fi

# Check node/npm
if ! command -v npm &>/dev/null; then
  warn "npm not found — prettier auto-format will be disabled"
  NPM_AVAILABLE=false
else
  ok "npm found: $(npm --version)"
  NPM_AVAILABLE=true
fi

# Check python3
if ! command -v python3 &>/dev/null; then
  warn "python3 not found — some hooks will use fallback mode"
  PYTHON_AVAILABLE=false
else
  ok "python3 found"
  PYTHON_AVAILABLE=true
fi

# ═══════════════════════════════════════════
# DETERMINE INSTALL SCOPE
# ═══════════════════════════════════════════
echo ""
echo -e "${BOLD}Where to install?${RESET}"
echo ""
echo "  [1] Global (~/.claude) — affects ALL your projects (recommended)"
echo "  [2] Project only (./.claude) — affects only this directory"
echo ""
read -p "  Choose [1/2, default=1]: " SCOPE_CHOICE
SCOPE_CHOICE="${SCOPE_CHOICE:-1}"

if [ "$SCOPE_CHOICE" = "2" ]; then
  INSTALL_DIR=".claude"
  SETTINGS_FILE=".claude/settings.json"
  CLAUDE_MD_FILE="CLAUDE.md"
  SCOPE_NAME="project"
  SCOPE_DIR="$(pwd)"
else
  INSTALL_DIR="$HOME/.claude"
  SETTINGS_FILE="$HOME/.claude/settings.json"
  CLAUDE_MD_FILE="$HOME/CLAUDE.md"
  SCOPE_NAME="global"
  SCOPE_DIR="$HOME"
fi

echo ""
info "Installing to $SCOPE_NAME scope: $SCOPE_DIR"

# ═══════════════════════════════════════════
# BACKUP EXISTING CONFIG
# ═══════════════════════════════════════════
step "Backing up existing configuration..."

BACKUP_DIR="$HOME/.cc-steroids-backup-$(date +%Y%m%d-%H%M%S)"

if [ -f "$SETTINGS_FILE" ] || [ -d "$INSTALL_DIR/agents" ] || [ -d "$INSTALL_DIR/skills" ]; then
  mkdir -p "$BACKUP_DIR"
  [ -f "$SETTINGS_FILE" ] && cp "$SETTINGS_FILE" "$BACKUP_DIR/settings.json" && ok "Backed up settings.json"
  [ -d "$INSTALL_DIR/agents" ] && cp -r "$INSTALL_DIR/agents" "$BACKUP_DIR/agents" && ok "Backed up agents/"
  [ -d "$INSTALL_DIR/skills" ] && cp -r "$INSTALL_DIR/skills" "$BACKUP_DIR/skills" && ok "Backed up skills/"
  [ -f "$CLAUDE_MD_FILE" ] && cp "$CLAUDE_MD_FILE" "$BACKUP_DIR/CLAUDE.md" && ok "Backed up CLAUDE.md"
  info "Backup saved to: $BACKUP_DIR"
else
  info "No existing config to back up"
fi

# ═══════════════════════════════════════════
# CREATE DIRECTORY STRUCTURE
# ═══════════════════════════════════════════
step "Creating directory structure..."

mkdir -p "$INSTALL_DIR/agents"
mkdir -p "$INSTALL_DIR/skills/manus-planner"
mkdir -p "$INSTALL_DIR/skills/risk-check"
mkdir -p "$INSTALL_DIR/skills/git-discipline"
mkdir -p "$INSTALL_DIR/skills/spawn-team"
mkdir -p "$INSTALL_DIR/skills/context-guardian"
mkdir -p "$INSTALL_DIR/hooks"

ok "Directory structure created"

# ═══════════════════════════════════════════
# INSTALL CLAUDE.MD
# ═══════════════════════════════════════════
step "Installing CLAUDE.md (master configuration)..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$CLAUDE_MD_FILE" ]; then
  echo ""
  warn "CLAUDE.md already exists."
  read -p "  Overwrite? (y/N): " OVERWRITE_MD
  if [ "$OVERWRITE_MD" = "y" ] || [ "$OVERWRITE_MD" = "Y" ]; then
    cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD_FILE"
    ok "CLAUDE.md installed (overwritten)"
  else
    info "Skipped CLAUDE.md (kept existing)"
  fi
else
  cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD_FILE"
  ok "CLAUDE.md installed"
fi

# ═══════════════════════════════════════════
# INSTALL SETTINGS.JSON (HOOKS + ENV)
# ═══════════════════════════════════════════
step "Installing settings.json (hooks + Agent Teams)..."

if [ -f "$SETTINGS_FILE" ]; then
  warn "settings.json already exists — merging Agent Teams env vars"
  # Try to inject just the env vars if python3 available
  if [ "$PYTHON_AVAILABLE" = true ]; then
    python3 -c "
import json, sys
try:
    with open('$SETTINGS_FILE') as f:
        config = json.load(f)
except:
    config = {}
env = config.setdefault('env', {})
env['CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS'] = '1'
env.setdefault('MAX_THINKING_TOKENS', '10000')
env.setdefault('CLAUDE_AUTOCOMPACT_PCT_OVERRIDE', '65')
with open('$SETTINGS_FILE', 'w') as f:
    json.dump(config, f, indent=2)
print('merged')
" && ok "Merged Agent Teams env vars into existing settings.json"
  else
    warn "Could not merge — install python3 and re-run, or manually add to settings.json:"
    echo '    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"'
  fi
else
  cp "$SCRIPT_DIR/.claude/settings.json" "$SETTINGS_FILE"
  ok "settings.json installed (hooks + Agent Teams enabled)"
fi

# ═══════════════════════════════════════════
# INSTALL AGENTS
# ═══════════════════════════════════════════
step "Installing specialized agents..."

for agent in security-reviewer codebase-explorer deep-researcher architect-planner code-reviewer debug-team; do
  cp "$SCRIPT_DIR/.claude/agents/$agent.md" "$INSTALL_DIR/agents/$agent.md"
  ok "Agent: $agent"
done

# ═══════════════════════════════════════════
# INSTALL SKILLS
# ═══════════════════════════════════════════
step "Installing power skills..."

for skill in manus-planner risk-check git-discipline spawn-team context-guardian; do
  mkdir -p "$INSTALL_DIR/skills/$skill"
  cp "$SCRIPT_DIR/.claude/skills/$skill/SKILL.md" "$INSTALL_DIR/skills/$skill/SKILL.md"
  ok "Skill: /$skill"
done

# ═══════════════════════════════════════════
# OPTIONAL: INSTALL MCPs
# ═══════════════════════════════════════════
echo ""
echo -e "${BOLD}Optional: Install recommended MCP servers?${RESET}"
echo ""
echo "  These give Claude real-world reach (web scraping, browser automation, docs)."
echo "  Requires npm. Skip if you don't need them or want to install manually."
echo ""
read -p "  Install MCPs? (y/N): " INSTALL_MCPS

if [ "$INSTALL_MCPS" = "y" ] || [ "$INSTALL_MCPS" = "Y" ]; then
  step "Installing MCP servers..."
  
  if [ "$NPM_AVAILABLE" = true ]; then
    # Context7 — live documentation
    echo "  Installing Context7 MCP (live API docs)..."
    claude mcp add context7 -- npx -y @upstash/context7-mcp 2>/dev/null && ok "Context7 MCP" || warn "Context7 MCP failed — install manually"
    
    # Playwright — browser automation
    echo "  Installing Playwright MCP (browser automation)..."
    npm install -g @playwright/mcp 2>/dev/null && claude mcp add playwright -- npx @playwright/mcp 2>/dev/null && ok "Playwright MCP" || warn "Playwright MCP failed — install manually"
    
    # Memory MCP
    echo "  Installing Memory MCP (persistent knowledge graph)..."
    claude mcp add memory -- npx -y @modelcontextprotocol/server-memory 2>/dev/null && ok "Memory MCP" || warn "Memory MCP failed — install manually"
    
    info "Core MCPs installed. Add Firecrawl/BrightData manually with your API keys."
  else
    warn "npm not found — skipping MCP installation"
    info "Install MCPs manually after installing npm"
  fi
fi

# ═══════════════════════════════════════════
# OPTIONAL: PRETTIER FOR AUTO-FORMAT HOOK
# ═══════════════════════════════════════════
if [ "$NPM_AVAILABLE" = true ]; then
  if ! npx prettier --version &>/dev/null 2>&1; then
    echo ""
    read -p "  Install prettier for auto-format hook? (y/N): " INSTALL_PRETTIER
    if [ "$INSTALL_PRETTIER" = "y" ] || [ "$INSTALL_PRETTIER" = "Y" ]; then
      npm install -g prettier 2>/dev/null && ok "prettier installed" || warn "prettier install failed — add manually"
    fi
  fi
fi

# ═══════════════════════════════════════════
# FINAL SUMMARY
# ═══════════════════════════════════════════
echo ""
echo -e "${GREEN}${BOLD}═══════════════════════════════════════════════════════${RESET}"
echo -e "${GREEN}${BOLD}  ⚡ CC-STEROIDS INSTALLED SUCCESSFULLY!${RESET}"
echo -e "${GREEN}${BOLD}═══════════════════════════════════════════════════════${RESET}"
echo ""
echo -e "${BOLD}What's installed:${RESET}"
echo ""
echo -e "  ${GREEN}✅ CLAUDE.md${RESET} — Master configuration (mandatory workflow, memory, safety)"
echo -e "  ${GREEN}✅ settings.json${RESET} — Agent Teams enabled + 4 active hooks"
echo ""
echo -e "  ${CYAN}🤖 6 Specialized Agents:${RESET}"
echo -e "     security-reviewer   → Security audits before any deploy"
echo -e "     codebase-explorer   → Read-only codebase mapping (session start)"
echo -e "     deep-researcher     → Manus AI multi-phase research"
echo -e "     architect-planner   → System design + ADRs before implementation"
echo -e "     code-reviewer       → Pre-merge quality review"
echo -e "     debug-team          → Competing hypotheses for hard bugs"
echo ""
echo -e "  ${PURPLE}🛠️  5 Power Skills:${RESET}"
echo -e "     /manus-planner      → Persistent filesystem memory for long tasks"
echo -e "     /risk-check         → Pre-task failure mode enumeration"
echo -e "     /git-discipline     → Conventional commits + PR templates"
echo -e "     /spawn-team         → Agent Teams templates for parallel work"
echo -e "     /context-guardian   → Context health management"
echo ""
echo -e "  ${YELLOW}🪝 4 Auto-Running Hooks:${RESET}"
echo -e "     PostToolUse Write   → Auto-format with prettier"
echo -e "     PostToolUse Write   → Auto-run tests on every code change"
echo -e "     PreToolUse Bash     → Block dangerous commands"
echo -e "     Stop                → Auto-commit checkpoint after every response"
echo ""

echo -e "${BOLD}Quick Start Commands:${RESET}"
echo ""
echo -e "  ${CYAN}claude${RESET}                       Start Claude Code"
echo -e "  ${CYAN}/manus-planner${RESET}               Start a long project with persistent memory"
echo -e "  ${CYAN}/spawn-team${RESET}                  Get templates for Agent Teams"
echo -e "  ${CYAN}/risk-check${RESET}                  Run pre-task risk assessment"
echo -e "  ${CYAN}/context-guardian${RESET}            Check context health"
echo ""
echo -e "  ${CYAN}\"Use the codebase-explorer agent\"${RESET}   → Map any new codebase"
echo -e "  ${CYAN}\"Use the architect-planner agent\"${RESET}   → Design before building"
echo -e "  ${CYAN}\"Use the debug-team agent\"${RESET}          → Competing hypotheses debug"
echo ""
echo -e "${BOLD}Learn more:${RESET} github.com/YOUR_HANDLE/cc-steroids"
echo ""

if [ -d "$BACKUP_DIR" ]; then
  info "Your original config was backed up to: $BACKUP_DIR"
  info "Restore anytime: cp -r $BACKUP_DIR/* $INSTALL_DIR/"
fi

echo ""
echo -e "${GREEN}${BOLD}Ready. Run 'claude' to start.${RESET}"
echo ""
