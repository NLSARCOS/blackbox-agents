# ⬛ Blackbox Agents — AI Agent Toolkit

> **20 Agents + 67 Skills + 25 Workflows** — Zero dependencies. Just copy `.agent/` to your project.

A unified AI development environment that combines three powerful systems into a single, portable toolkit:

| System | What it provides |
|--------|-----------------|
| **[Antigravity Kit](https://github.com/vudovn/antigravity-kit)** | 20 specialist agents, 37 domain skills, validation scripts |
| **[OpenSpec](https://github.com/Fission-AI/OpenSpec)** | Spec-driven formal planning (proposal → design → specs → tasks) |
| **[GSAP Skills](https://github.com/greensock/gsap-skills)** | 8 animation domain skills for production-grade motion design |
| **[Superpowers](https://github.com/obra/superpowers)** | 9 workflow skills for TDD, debugging, and systematic development |

---

## ⚡ Quick Start

**One command to install everything:**

```bash
bash <(curl -sL https://raw.githubusercontent.com/NLSARCOS/blackbox-agents/main/setup.sh)
```

This copies `.agent/` into your project. Then tell your AI:

```
run /init
```

That generates `AGENTS.md` — the single file any AI reads to understand your project.

**Alternative: manual install**

```bash
git clone https://github.com/NLSARCOS/blackbox-agents.git
cp -r blackbox-agents/.agent/ /your/project/
```

**That's it.** No `npm install`, no CLI tools, no dependencies. Everything is Markdown that your AI reads.

---

## 🧠 How It Works

The **Super Orchestrator** automatically analyzes every request and routes it to the right specialist:

- **Fast Path Context Pack:** Start with a compact repo snapshot before loading heavier docs.
- **Risk-Based OpenSpec:** Formal planning only when ambiguity or risk is material.
- **Project Learning (`/learn`):** AI can extract stable repo-specific patterns into project-scoped skills, with threshold-based auto-materialization inside the same repo.
- **Auto-Validation:** Instantly catches security, UX, and SEO regressions on local changes.

```
YOUR REQUEST
    │
    ├─ Simple fix?        → Direct agent (frontend, backend, etc.)
    ├─ Animation?         → GSAP skills auto-loaded
    ├─ New feature?       → OpenSpec planning → then agents execute
    └─ Complex task?      → Multi-agent orchestration
```

### Example Flow

```
You: "Add scroll animations to the hero section"

AI: 🤖 Applying knowledge of @frontend-specialist...
    Loading skills: gsap-core, gsap-scrolltrigger
    [implements with production-grade GSAP patterns]
```

```
You: "Build a checkout system with payments"

AI: 💡 This affects 5+ files. Running /opsx-propose for formal planning...
    → Creates proposal.md, design.md, specs/, tasks.md
    → Then routes each task to the right specialist agent
```

---

## 📦 What's Inside

### Agents (20 specialists)

| Agent | Domain |
|-------|--------|
| `orchestrator` | 🧠 Central intelligence & routing |
| `frontend-specialist` | Web UI/UX, React, CSS |
| `backend-specialist` | API, Node.js, Express |
| `mobile-developer` | React Native, Flutter |
| `database-architect` | Schema, SQL, Prisma |
| `security-auditor` | OWASP, vulnerabilities |
| `test-engineer` | Jest, Playwright, TDD |
| `debugger` | Root cause analysis |
| `devops-engineer` | CI/CD, Docker, deploy |
| `performance-optimizer` | Web Vitals, speed |
| `project-planner` | Planning & roadmap |
| `game-developer` | Unity, Godot, Phaser |
| ...and 8 more | Full coverage |

### Skills (67 knowledge modules)

- **37 Kit Skills**: clean-code, api-patterns, frontend-design, database-design, vulnerability-scanner, testing-patterns, and more
- **4 OpenSpec Skills**: propose, apply, explore, archive — spec-driven planning without CLI
- **8 GSAP Skills**: core, scrolltrigger, timeline, react, frameworks, plugins, performance, utils
- **9 Superpowers Skills**: TDD, systematic debugging, brainstorming, writing plans, subagent development, and more
- **9 Brand Design Systems**: Linear, Vercel, Stripe, Notion, Spotify, Framer, Apple, ClickHouse, and more — exact design tokens from real websites

### Superpowers Skills (9 systematic development skills)

| Skill | Purpose |
|-------|---------|
| `sp-brainstorming` | 🧠 Explore requirements and create design specs before coding |
| `sp-writing-plans` | 📝 Create detailed implementation plans with bite-sized tasks |
| `sp-tdd` | 🔴🟢🔵 Test-Driven Development: RED-GREEN-REFACTOR cycle |
| `sp-systematic-debugging` | 🐛 4-phase systematic debugging process |
| `sp-subagent-dev` | 🤖 Execute plans with subagents + two-stage review |
| `sp-executing-plans` | ▶️ Execute implementation plans with checkpoints |
| `sp-git-worktrees` | 🌳 Create isolated git worktrees for feature development |
| `sp-finish-branch` | ✅ Complete development with merge/PR/cleanup options |
| `sp-code-review` | 👀 Request and conduct code reviews |

### Brand Design Systems (NEW — 25+ brand presets)

Access exact design tokens from popular brands as reference for your designs:

| Brand | Style | Primary Colors |
|-------|-------|----------------|
| **Linear** | Minimal precision purple dark | `#5E6AD2` / `#0F111A` |
| **Vercel** | Monochrome geist precision | `#171717` / `#FFFFFF` |
| **Stripe** | Elegant gradient purple | `#533AFD` / `#FFFFFF` |
| **Notion** | Warm minimalism serif | `#0075DE` / `#F6F5F4` |
| **Spotify** | Dark vibrant green | `#1ED760` / `#121212` |
| **Framer** | Bold black blue motion-first | `#0099FF` / `#000000` |
| **Apple** | Premium white-space sf-pro | `#0071E3` / `#F5F5F7` |
| **ClickHouse** | Neon black speed acid-yellow | `#FAFF69` / `#000000` |
| **+17 more** | Claude, Figma, Sentry, Supabase, Raycast... | See `/ui-ux-pro-max` |

```bash
# Get complete design system for a brand
python3 .agent/.shared/ui-ux-pro-max/scripts/search.py --brand linear

# Search brands by style
python3 .agent/.shared/ui-ux-pro-max/scripts/search.py "dark minimal purple" --brand-search

# Find similar brands
python3 .agent/.shared/ui-ux-pro-max/scripts/search.py --similar-to stripe
```

### Workflows (25 slash commands)

| Command | What it does |
|---------|-------------|
| `/plan` | 4-phase project planning |
| `/create` | Build new app from scratch |
| `/debug` | Systematic debugging |
| `/learn` | Extract a reusable project-specific skill |
| `/test` | Generate and run tests |
| `/deploy` | Pre-flight checks + deploy |
| `/orchestrate` | Multi-agent coordination |
| `/opsx-propose` | Create formal change proposal |
| `/opsx-apply` | Implement from proposal |
| `/opsx-explore` | Think/explore before building |
| `/opsx-archive` | Archive completed change |
| `/ui-ux-pro-max` | Premium UI design with 25+ brand systems |
| `/preview` | Start, inspect, and manage local preview |
| `/status` | Show current system and project status |
| `/brainstorm` | Structured discovery and ideation |
| `/enhance` | Improve existing codebases |
| **Superpowers Workflows** ||
| `/superpowers` | Complete Superpowers workflow (8 phases) |
| `/sp-brainstorm` | Brainstorm design specs before coding |
| `/sp-plan` | Create detailed implementation plans |
| `/sp-tdd` | Enforce TDD on current task |
| `/sp-debug` | 4-phase systematic debugging |
| `/sp-subagent` | Execute with subagents + review |
| `/sp-execute` | Execute plans inline |
| `/sp-worktree` | Create isolated git workspace |
| `/sp-finish` | Complete development with merge options |

---

## 🏗️ Directory Structure

```
.agent/
├── ARCHITECTURE.md          # System map
├── agents/                  # 20 specialist agents
│   └── orchestrator.md      # 🧠 Super Orchestrator
├── skills/                  # 67 skills
│   ├── openspec-*/          # 4 planning skills
│   ├── gsap-*/              # 8 animation skills
│   ├── sp-*/                # 9 Superpowers skills
│   ├── design-presets/      # 25+ brand design systems
│   └── .../                 # 37 kit skills
├── project-skills/          # project-scoped learned skills from /learn
├── workflows/               # 16 slash commands
├── rules/
│   └── GEMINI.md            # Master config (routing rules)
├── scripts/                 # Validation scripts
└── .shared/                 # Shared resources
```

---

## 🔧 Validation Scripts

Built-in Python scripts for project auditing (no external deps):

```bash
# Daily operational check
python3 .agent/scripts/doctor.py

# Low-token startup context only
python3 .agent/scripts/context_pack.py

# Change-aware validation after edits
python3 .agent/scripts/smart_validate.py

# Internal toolkit consistency audit
python3 .agent/scripts/self_check.py .

# Quick validation during development
python3 .agent/scripts/checklist.py .

# Full verification before deployment
python3 .agent/scripts/verify_all.py . --url http://localhost:3000
```

Checks: Security → Lint → Schema → Tests → UX → SEO → Performance

`doctor.py` is the recommended starting point for daily use. It now includes the compact context pack, `.agent` health, preview readiness, detected project scripts, and suggested next actions in one command.
`context_pack.py` is the best token-saving entry point because it gives a compact operational summary before the system loads heavier docs or skills.
`smart_validate.py` is the recommended default after local edits because it runs only the checks most relevant to the files you changed.
`/learn` now supports project-scoped automatic learning through `.agent/project-skills/_registry.json`, so repeated local conventions can become reusable skills without polluting the shared toolkit.

---

## 📋 Compatibility

| AI Tool | Compatible |
|---------|-----------|
| Cursor | ✅ |
| Windsurf | ✅ |
| Claude Code | ✅ |
| Cline/Continue | ✅ |
| Any AI that reads `.agent/` | ✅ |

---

## 🙏 Credits

This toolkit unifies work from five open-source projects:

- **[Antigravity Kit](https://github.com/vudovn/antigravity-kit)** by @vudovn — The agent/skill/workflow foundation
- **[OpenSpec](https://github.com/Fission-AI/OpenSpec)** by @Fission-AI — Spec-driven planning framework
- **[GSAP Skills](https://github.com/greensock/gsap-skills)** by @greensock — Animation domain expertise
- **[Superpowers](https://github.com/obra/superpowers)** by @obra — Systematic development workflow skills
- **[Awesome Design MD](https://github.com/VoltAgent/awesome-design-md)** by @VoltAgent — Brand design systems from real websites

---

## 📄 License

MIT — Use freely in any project.
