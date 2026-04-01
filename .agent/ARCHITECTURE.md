# Unified Architecture — Antigravity + OpenSpec + GSAP

> AI Agent Capability Expansion Toolkit — Unified Edition

---

## 📋 Overview

This workspace unifies **three** complementary systems into a single development environment:

| System | Purpose | Components |
|--------|---------|------------|
| **Antigravity Kit** | Agent execution, validation, workflows | 20 agents, 37 skills, 11 workflows, scripts |
| **OpenSpec** | Spec-driven formal planning | 4 skills, 4 workflows, `openspec/` data |
| **GSAP Skills** | Animation domain expertise | 8 specialized animation skills |

**Total**: 20 agents + 49 skills + 16 workflows + validation scripts

---

## 🏗️ Directory Structure

```plaintext
.agent/
├── ARCHITECTURE.md          # This file — unified system map
├── agents/                  # 20 Specialist Agents
│   ├── orchestrator.md      # 🧠 Super Orchestrator (decision engine)
│   ├── frontend-specialist.md
│   ├── backend-specialist.md
│   ├── mobile-developer.md
│   ├── security-auditor.md
│   ├── database-architect.md
│   ├── test-engineer.md
│   └── ... (13 more)
├── skills/                  # 49 Skills (Kit + OpenSpec + GSAP)
│   ├── intelligent-routing/ # Auto agent selection
│   ├── openspec-*/          # 4 OpenSpec skills
│   ├── gsap-*/              # 8 GSAP animation skills
│   └── ... (37 Kit skills)
├── project-skills/          # Project-scoped learned skills created by /learn
│   ├── _registry.json       # Learning signals, thresholds, and materialization state
├── workflows/               # 16 Slash Commands (Kit + OpenSpec)
│   ├── opsx-propose.md      # OpenSpec propose
│   ├── opsx-apply.md        # OpenSpec execute
│   └── ... (13 more)
├── rules/                   # Global Rules
│   └── GEMINI.md            # 🔴 Master ruleset
├── scripts/                 # Validation & Audit
│   ├── checklist.py
│   └── verify_all.py
└── .shared/                 # Shared resources

openspec/                    # OpenSpec data directory
├── changes/                 # Active changes
│   └── {change-name}/
│       ├── proposal.md
│       ├── design.md
│       ├── specs/*.md
│       └── tasks.md
└── archive/                 # Completed changes
```

---

## 🧠 Decision Engine

The Super Orchestrator follows this decision flow for every request:

```
USER REQUEST ──→ CLASSIFY
                    │
    ┌───────────────┼─────────────────────────┐
    ▼               ▼                         ▼
 SIMPLE          MEDIUM                    COMPLEX
 (score 1-2)     (score 3-4)               (score 5+)
    │               │                         │
    ▼               ▼                         ▼
 Single Agent    Direct execution or      OpenSpec + multi-agent
 auto-invoke     light planning           orchestration
                 (if ambiguity/risk)      for high-risk changes
```

### Complexity Scoring

| Signal | Score |
|--------|-------|
| Single file edit | +1 |
| 2-3 files affected | +2 |
| New architectural component | +3 |
| Multiple domains (FE+BE+DB) | +4 |
| Unclear requirements | +5 |

---

## 🤖 Agents (20)

| Agent | Domain | Key Skills |
|-------|--------|------------|
| `orchestrator` | 🧠 Central intelligence | All systems |
| `project-planner` | Planning & roadmap | brainstorming, plan-writing, architecture |
| `frontend-specialist` | Web UI/UX + Animation | frontend-design, gsap-core, tailwind-patterns |
| `backend-specialist` | API & business logic | api-patterns, nodejs-best-practices |
| `database-architect` | Schema & SQL | database-design |
| `mobile-developer` | iOS, Android, RN | mobile-design |
| `game-developer` | Game mechanics | game-development |
| `devops-engineer` | CI/CD, Docker | deployment-procedures |
| `security-auditor` | Security compliance | vulnerability-scanner, red-team-tactics |
| `penetration-tester` | Offensive security | red-team-tactics |
| `test-engineer` | Testing strategies | testing-patterns, tdd-workflow |
| `debugger` | Root cause analysis | systematic-debugging |
| `performance-optimizer` | Web Vitals, speed | performance-profiling |
| `seo-specialist` | SEO & ranking | seo-fundamentals, geo-fundamentals |
| `documentation-writer` | Docs & manuals | documentation-templates |
| `product-manager` | Requirements | brainstorming |
| `product-owner` | Strategy & backlog | brainstorming |
| `qa-automation-engineer` | E2E, CI pipelines | webapp-testing |
| `code-archaeologist` | Legacy code | clean-code |
| `explorer-agent` | Codebase discovery | — |

---

## 🧩 Skills (49)

### Kit Skills (37)

**Frontend & UI**: `frontend-design`, `react-best-practices` (nextjs-react-expert), `web-design-guidelines`, `tailwind-patterns`

**Backend & API**: `api-patterns`, `nodejs-best-practices`, `python-patterns`, `rust-pro`

**Database**: `database-design`

**Testing & Quality**: `testing-patterns`, `webapp-testing`, `tdd-workflow`, `code-review-checklist`, `lint-and-validate`

**Security**: `vulnerability-scanner`, `red-team-tactics`

**Architecture & Planning**: `app-builder`, `architecture`, `plan-writing`, `brainstorming`

**Mobile**: `mobile-design`

**Game**: `game-development`

**SEO & Growth**: `seo-fundamentals`, `geo-fundamentals`

**DevOps**: `deployment-procedures`, `server-management`

**Shell/CLI**: `bash-linux`, `powershell-windows`

**Other**: `clean-code`, `behavioral-modes`, `parallel-agents`, `intelligent-routing`, `mcp-builder`, `documentation-templates`, `i18n-localization`, `performance-profiling`, `systematic-debugging`

### OpenSpec Skills (4)

| Skill | Purpose | Workflow |
|-------|---------|----------|
| `openspec-propose` | Create formal change proposal | `/opsx-propose` |
| `openspec-apply-change` | Implement tasks from proposal | `/opsx-apply` |
| `openspec-explore` | Think/explore before building | `/opsx-explore` |
| `openspec-archive-change` | Archive completed change | `/opsx-archive` |

### GSAP Animation Skills (8)

| Skill | Purpose | Keywords |
|-------|---------|----------|
| `gsap-core` | Core API: tweens, easing, stagger | animate, tween, ease |
| `gsap-scrolltrigger` | Scroll-linked animations | scroll, parallax, pin, scrub |
| `gsap-timeline` | Sequential choreography | timeline, sequence, keyframe |
| `gsap-react` | React/Next.js integration | useGSAP, react, next |
| `gsap-frameworks` | Vue, Svelte, other frameworks | vue, svelte, nuxt |
| `gsap-plugins` | Flip, Draggable, SplitText, SVG | flip, drag, split, morph |
| `gsap-performance` | 60fps optimization | performance, jank, fps |
| `gsap-utils` | Utility functions | clamp, mapRange, snap, wrap |

---

## 🔄 Workflows (16)

### Kit Workflows (12)

| Command | Description |
|---------|-------------|
| `/brainstorm` | Socratic discovery |
| `/create` | Create new app/feature |
| `/debug` | Systematic debugging |
| `/deploy` | Deploy to production |
| `/enhance` | Improve existing code |
| `/learn` | Extract a project-scoped reusable skill |
| `/orchestrate` | Multi-agent coordination |
| `/plan` | Task breakdown |
| `/preview` | Preview changes |
| `/status` | Check project status |
| `/test` | Run tests |
| `/ui-ux-pro-max` | Premium UI design |

### OpenSpec Workflows (4)

| Command | Description |
|---------|-------------|
| `/opsx-propose` | Create formal change proposal |
| `/opsx-apply` | Implement from proposal |
| `/opsx-explore` | Think before building |
| `/opsx-archive` | Archive completed change |

---

## 📜 Scripts

### Master Validation Scripts

| Script | Purpose | Usage |
|--------|---------|-------|
| `doctor.py` | Daily operational health check | `python3 .agent/scripts/doctor.py` |
| `smart_validate.py` | Change-aware validation runner | `python3 .agent/scripts/smart_validate.py` |
| `self_check.py` | Internal `.agent` consistency audit | `python3 .agent/scripts/self_check.py .` |
| `checklist.py` | Priority-based project audit | `python3 .agent/scripts/checklist.py .` |
| `verify_all.py` | Full verification suite | `python3 .agent/scripts/verify_all.py . --url <URL>` |

### Skill-Level Scripts (12)

| Script | Skill | When |
|--------|-------|------|
| `security_scan.py` | vulnerability-scanner | Always on deploy |
| `dependency_analyzer.py` | vulnerability-scanner | Weekly / Deploy |
| `lint_runner.py` | lint-and-validate | Every code change |
| `test_runner.py` | testing-patterns | After logic change |
| `schema_validator.py` | database-design | After DB change |
| `ux_audit.py` | frontend-design | After UI change |
| `accessibility_checker.py` | frontend-design | After UI change |
| `seo_checker.py` | seo-fundamentals | After page change |
| `bundle_analyzer.py` | performance-profiling | Before deploy |
| `mobile_audit.py` | mobile-design | After mobile change |
| `lighthouse_audit.py` | performance-profiling | Before deploy |
| `playwright_runner.py` | webapp-testing | Before deploy |

---

## 📊 Statistics

| Metric | Value |
|--------|-------|
| **Total Agents** | 20 |
| **Total Skills** | 49 (37 Kit + 4 OpenSpec + 8 GSAP) |
| **Total Workflows** | 16 (12 Kit + 4 OpenSpec) |
| **Total Scripts** | 5 master + 12 skill-level |
| **Coverage** | ~95% web/mobile/animation development |

---

## 🔗 Quick Reference

| Need | Agent | Skills |
|------|-------|--------|
| Web App | `frontend-specialist` | frontend-design, react-best-practices |
| API | `backend-specialist` | api-patterns, nodejs-best-practices |
| Mobile | `mobile-developer` | mobile-design |
| Database | `database-architect` | database-design |
| Security | `security-auditor` | vulnerability-scanner |
| Testing | `test-engineer` | testing-patterns, webapp-testing |
| Debug | `debugger` | systematic-debugging |
| Plan | `project-planner` | brainstorming, plan-writing |
| Animation | `frontend-specialist` | gsap-core + gsap-* |
| Formal Plan | orchestrator | openspec-propose |

---

## ✅ Daily-Use Principles

This `.agent` system is optimized for everyday development work:

- **Default to execution** for clear, low-risk requests.
- **Ask questions only when ambiguity, product risk, or architecture impact is real.**
- **Escalate to planning** for multi-domain features, high-risk changes, or unclear scope.
- **Run validation proportionally** to the size and risk of the change.
- **Keep memory and codebase maps current** so future sessions start with context instead of re-discovery.
- **Prefer parallel subagents** when tasks are independent and write scopes do not overlap.
- **Start sessions with `doctor.py`** when you want a fast, high-signal readiness check.
- **Keep learned skills project-scoped** in `.agent/project-skills/` so one repo does not contaminate another.
- **Allow automatic learning only inside the project boundary** using threshold-based materialization.
