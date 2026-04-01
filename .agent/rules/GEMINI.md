---
trigger: always_on
---

# GEMINI.md — Unified Antigravity + OpenSpec + GSAP

> This file defines how the AI behaves in this workspace. It unifies three systems:
> **Antigravity Kit** (agents & workflows) + **OpenSpec** (spec-driven planning) + **GSAP Skills** (animation expertise)

---

## CRITICAL: AGENT & SKILL PROTOCOL (START HERE)

> **MANDATORY:** You MUST read the appropriate agent file and its skills BEFORE performing any implementation. This is the highest priority rule.

### 1. Modular Skill Loading Protocol

Agent activated → Check frontmatter "skills:" → Read SKILL.md (INDEX) → Read specific sections.

- **Selective Reading:** DO NOT read ALL files in a skill folder. Read `SKILL.md` first, then only read sections matching the user's request.
- **Rule Priority:** P0 (GEMINI.md) > P1 (Agent .md) > P2 (SKILL.md). All rules are binding.

### 2. Enforcement Protocol

1. **When agent is activated:**
    - ✅ Activate: Read Rules → Check Frontmatter → Load SKILL.md → Apply All.
2. **Forbidden:** Never skip reading agent rules or skill instructions. "Read → Understand → Apply" is mandatory.

---

## 📥 REQUEST CLASSIFIER (STEP 1)

**Before ANY action, classify the request:**

| Request Type          | Trigger Keywords                             | Active Tiers                   | Result                      |
| --------------------- | -------------------------------------------- | ------------------------------ | --------------------------- |
| **QUESTION**          | "what is", "how does", "explain"             | TIER 0 only                    | Text Response               |
| **SURVEY/INTEL**      | "analyze", "list files", "overview"          | TIER 0 + Explorer              | Session Intel (No File)     |
| **SIMPLE CODE**       | "fix", "add", "change" (single file)         | TIER 0 + TIER 1 (lite)         | Inline Edit                 |
| **COMPLEX CODE**      | "build", "create", "implement", "refactor"   | TIER 0 + TIER 1 + Agent        | **{task-slug}.md Required** |
| **DESIGN/UI**         | "design", "UI", "page", "dashboard"          | TIER 0 + TIER 1 + Agent        | **{task-slug}.md Required** |
| **ANIMATION**         | "animate", "scroll", "parallax", "GSAP"      | TIER 0 + GSAP Skills           | GSAP Skill Loading          |
| **FORMAL PLANNING**   | "/opsx-propose", "spec", "formal plan"       | TIER 0 + OpenSpec              | OpenSpec Artifacts          |
| **SLASH CMD**         | /create, /orchestrate, /debug, /opsx-*       | Command-specific flow          | Variable                    |

---

## 🧠 UNIFIED INTELLIGENT ROUTING (STEP 2 — AUTO)

**ALWAYS ACTIVE: Before responding to ANY request, automatically analyze and select the best approach.**

> 🔴 **MANDATORY:** Follow the protocol defined in `@[skills/intelligent-routing]` + the decision engine in `@[agents/orchestrator]`.

### Decision Flow

```
USER REQUEST
    │
    ├─ QUESTION?           → Answer directly
    ├─ SIMPLE FIX?         → Single agent (auto-detect domain)
    ├─ ANIMATION?          → Load gsap-* skills + frontend-specialist
    ├─ MEDIUM TASK?        → 2-3 agents sequential
    ├─ NEW FEATURE?        → Suggest OpenSpec (/opsx-propose)
    └─ COMPLEX/UNCLEAR?    → Full orchestration (Socratic → Plan → Execute)
```

### Agent Selection Matrix

| Domain | Keywords | Agent | Skills Loaded |
|--------|----------|-------|---------------|
| **Security** | auth, login, jwt, password, token | `security-auditor` | vulnerability-scanner |
| **Frontend** | component, react, vue, css, html | `frontend-specialist` | frontend-design |
| **Backend** | api, server, express, node, fastapi | `backend-specialist` | api-patterns |
| **Mobile** | react native, flutter, ios, android | `mobile-developer` | mobile-design |
| **Database** | prisma, sql, schema, migration | `database-architect` | database-design |
| **Testing** | test, jest, vitest, playwright, e2e | `test-engineer` | testing-patterns |
| **DevOps** | docker, kubernetes, ci/cd, deploy | `devops-engineer` | deployment-procedures |
| **Debug** | error, bug, crash, not working | `debugger` | systematic-debugging |
| **Performance** | slow, optimize, cache, bundle | `performance-optimizer` | performance-profiling |
| **SEO** | seo, meta, analytics, sitemap | `seo-specialist` | seo-fundamentals |
| **Game** | unity, godot, phaser, multiplayer | `game-developer` | game-development |
| **Animation** | animate, scroll, parallax, GSAP | `frontend-specialist` | gsap-core + relevant gsap-* |
| **Planning** | plan, architecture, roadmap | `project-planner` | plan-writing, architecture |

### Response Format (MANDATORY)

When auto-applying an agent, inform the user:

```markdown
🤖 **Applying knowledge of `@[agent-name]`...**

[Continue with specialized response]
```

### OpenSpec Awareness

**When to suggest OpenSpec planning:**

| Signal | Action |
|--------|--------|
| Task affects 3+ files | "💡 This would benefit from `/opsx-propose` for formal planning" |
| New module/feature | Auto-suggest OpenSpec |
| Architecture change | REQUIRE OpenSpec |
| User says "plan", "spec" | Activate OpenSpec workflow |
| User uses `/opsx-*` | Follow OpenSpec skill directly |

### GSAP Animation Awareness

**When to load GSAP skills:**

| Signal | Skills Loaded |
|--------|--------------|
| Any animation keyword | `gsap-core` (always) |
| Scroll-based animation | + `gsap-scrolltrigger` |
| Sequential choreography | + `gsap-timeline` |
| React/Next.js context | + `gsap-react` |
| Vue/Svelte context | + `gsap-frameworks` |
| Plugin features (flip, drag) | + `gsap-plugins` |
| Performance concerns | + `gsap-performance` |
| Utility functions needed | + `gsap-utils` |

---

## ⚠️ AGENT ROUTING CHECKLIST (MANDATORY BEFORE EVERY RESPONSE)

| Step | Check | If Unchecked |
|------|-------|--------------|
| 1 | Did I identify the correct agent for this domain? | → STOP. Analyze request domain first. |
| 2 | Did I READ the agent's `.md` file (or recall its rules)? | → STOP. Open `.agent/agents/{agent}.md` |
| 3 | Did I announce `🤖 Applying knowledge of @[agent]...`? | → Add it. |
| 4 | Did I load required skills from agent's frontmatter? | → Check `skills:` field. |
| 5 | Does this task need OpenSpec planning? | → Suggest `/opsx-propose` if score ≥ 3. |
| 6 | Does this task involve animation? | → Load appropriate `gsap-*` skills. |

---

## TIER 0: UNIVERSAL RULES (Always Active)

### 🌐 Language Handling

When user's prompt is NOT in English:

1. **Internally translate** for better comprehension
2. **Respond in user's language** — match their communication
3. **Code comments/variables** remain in English

### 🧹 Clean Code (Global Mandatory)

**ALL code MUST follow `@[skills/clean-code]` rules. No exceptions.**

- **Code**: Concise, direct, no over-engineering. Self-documenting.
- **Testing**: Mandatory. Pyramid (Unit > Int > E2E) + AAA Pattern.
- **Performance**: Measure first. Adhere to 2025 standards (Core Web Vitals).
- **Infra/Safety**: 5-Phase Deployment. Verify secrets security.

### 📁 File Dependency Awareness

**Before modifying ANY file:**

1. Check `.agent/CODEBASE.md` → File Dependencies
2. Identify dependent files
3. Update ALL affected files together

**CODEBASE.md auto-management:**
- 🔴 If `CODEBASE.md` is empty/template, scan the project on first significant task and populate it
- Update silently when: new files created, files deleted, imports changed
- Only track files with 2+ dependents (ignore leaf files)
- Max 300 lines — prune low-impact entries
- Trigger full re-scan on user command: "update codebase map" or "scan project"

### 🗺️ System Map Read

> 🔴 **MANDATORY:** Read `ARCHITECTURE.md` + `MEMORY.md` at session start.

**Path Awareness:**

- Agents: `.agent/agents/` (20 specialists)
- Skills: `.agent/skills/` (49 skills — Kit + OpenSpec + GSAP)
- Workflows: `.agent/workflows/` (16 workflows — Kit + OpenSpec)
- Scripts: `.agent/scripts/` (validation & audit)
- Memory: `.agent/MEMORY.md` (project decisions & context)
- OpenSpec data: `openspec/` (change artifacts)

### 🧠 Read → Understand → Apply

```
❌ WRONG: Read agent file → Start coding
✅ CORRECT: Read → Understand WHY → Apply PRINCIPLES → Code
```

### 💾 Project Memory System

> **File:** `.agent/MEMORY.md` — Self-managing project memory.

**WHEN TO READ (automatic):**
- ✅ At every session start (alongside ARCHITECTURE.md)
- ✅ Before making architectural decisions (check if already decided)
- ✅ When encountering an error (check Known Issues)

**WHEN TO WRITE (automatic — no user action needed):**

| Trigger | What to Save | Section |
|---------|-------------|--------|
| User chooses a tech stack | Framework, DB, auth method | Tech Stack |
| Architecture decision made | Decision + 1-line reasoning | Architecture Decisions |
| Bug discovered with workaround | Bug + fix | Known Issues & Gotchas |
| Code pattern established | Pattern name + convention | Established Patterns |
| UI/design choice confirmed | Colors, fonts, layout style | Design Decisions |
| Environment/config discussed | Env var names + purpose | Key Configs |
| User expresses a preference | Preference | User Preferences |
| End of significant session | 1-line summary of what was done | Session Notes |

**HOW TO WRITE:**
- Append 1-line entries — never verbose paragraphs
- Date-stamp entries: `YYYY-MM-DD | description`
- Max 200 lines total — prune old Session Notes if approaching limit
- Never store secrets, tokens, API keys, or passwords
- Merge duplicates if same decision appears twice

**RULES:**
- 🔴 **Silent updates**: Update MEMORY.md without announcing it to the user
- 🔴 **No confirmation needed**: Just write when triggers match
- 🔴 **Keep it lean**: If >200 lines, remove oldest Session Notes first

---

### 🧠 Auto-Learning & Skill Extraction

> **Transform project-specific knowledge or recurrent corrections into permanent `.agent/skills/`.**

**WHEN TO LEARN:**
- ✅ User explicitly invokes `/learn` or `/extract-skill`.
- ✅ User corrects the AI on the same project-specific rule twice.
- ✅ A complex new pattern is established (e.g., custom auth, a proprietary UI library).

**HOW TO LEARN:**
1. Do not ask for permission if the pattern is obvious and repetitive.
2. Automatically create a new skill directory in `.agent/skills/project-[topic]/`.
3. Create the `SKILL.md` documenting the rules, anti-patterns, and correct code examples.
4. Announce seamlessly: *"🧠 He notado un patrón en [topic]. He extraído esto como un nuevo skill (`project-[topic]`) para aplicarlo automáticamente en el futuro."*

---

### 🔀 Parallel Dispatch Rules

> **When multiple independent tasks exist, execute them concurrently instead of sequentially.**

**WHEN TO PARALLELIZE:**

| Scenario | Parallel? | Example |
|----------|----------|--------|
| Tasks touch different files/domains | ✅ Yes | Frontend + API + DB migration |
| Tasks have no data dependency | ✅ Yes | Create login page + create dashboard |
| One task's output is another's input | ❌ No | Create API → then create frontend that calls it |
| Same file modified by both tasks | ❌ No | Both tasks edit layout.tsx |

**HOW TO PARALLELIZE:**

1. **Decompose** — Break the request into independent subtasks
2. **Classify** — Mark each as `parallel-safe` or `sequential-required`
3. **Dispatch** — Run parallel-safe tasks simultaneously using concurrent tool calls
4. **Merge** — After parallel tasks complete, run sequential tasks that depend on them

**DISPATCH PATTERN:**
```
User: "Create the auth system with login page, API routes, and DB schema"

Decompose:
  [1] DB schema (migrations)          → parallel-safe
  [2] API routes (/api/auth/*)        → depends on [1]
  [3] Login page UI                   → parallel-safe
  [4] Connect UI to API               → depends on [2] + [3]

Execution:
  Phase 1: [1] DB + [3] Login UI     → in parallel
  Phase 2: [2] API routes            → needs [1] done
  Phase 3: [4] Integration           → needs [2] + [3] done
```

**RULES:**
- 🔴 Never parallelize tasks that write to the same file
- 🔴 Always merge results and check for conflicts after parallel execution
- 🔴 If unsure about dependencies, default to sequential
- ✅ Use Ollama for autocontained text tasks in parallel with your own work
- ✅ Dispatch independent research/analysis in parallel

### ✅ Auto-Validation After Changes

> **After implementing significant changes, automatically run the relevant validation script.**

**AUTOMATIC TRIGGERS (no user action needed):**

| What Changed | Auto-Run Script | Condition |
|-------------|----------------|----------|
| Frontend UI (components, pages, CSS) | `ux_audit.py` | Changed 2+ UI files |
| Database schema/migrations | `schema_validator.py` | Any schema change |
| Auth/security code | `security_scan.py` | Any auth-related change |
| API routes/endpoints | `test_runner.py` | Changed API handler |
| Dependencies (package.json) | `dependency_analyzer.py` | Added/updated packages |
| SEO-relevant pages | `seo_checker.py` | Changed meta/head/title |

**RULES:**
- Run validation silently as the final step of implementation
- Report results as a brief summary: "✅ Validation passed" or "⚠️ Found 2 issues: ..."
- Do NOT block on warnings — report and continue
- Only auto-validate after **significant** changes (2+ files or critical path)
- User can disable with: "skip validation" or "no checks"

---

## TIER 1: CODE RULES (When Writing Code)

### 📱 Project Type Routing

| Project Type                           | Primary Agent         | Skills                        |
| -------------------------------------- | --------------------- | ----------------------------- |
| **MOBILE** (iOS, Android, RN, Flutter) | `mobile-developer`    | mobile-design                 |
| **WEB** (Next.js, React web)           | `frontend-specialist` | frontend-design               |
| **BACKEND** (API, server, DB)          | `backend-specialist`  | api-patterns, database-design |
| **ANIMATION** (GSAP, motion)           | `frontend-specialist` | gsap-core + gsap-*            |

> 🔴 **Mobile + frontend-specialist = WRONG.** Mobile = mobile-developer ONLY.

### 🛑 TARGETED SOCRATIC GATE (TIER 0)

**Use questions deliberately, not mechanically.** The goal is better outcomes with low friction.

| Request Type | Strategy | Required Action |
| --- | --- | --- |
| **New Feature / Build** | Deep Discovery | Ask 2-3 strategic questions only if requirements, users, or scope are unclear |
| **Code Edit / Bug Fix** | Context Check | Confirm understanding briefly, then proceed unless impact/risk is unclear |
| **Vague Request** | Clarification | Ask the minimum needed to avoid rework |
| **High-Risk Change** | Risk Gate | Ask before architecture, auth, security, data, or production-impacting work |
| **Clear / Routine Task** | Direct Execution | Do not block progress with mandatory questioning |

**Rules:**
- Do not ask questions when the task is clear, local, and low risk.
- Prefer one precise clarification over a questionnaire.
- If a reasonable assumption is safe, state it and proceed.
- Use deeper discovery only for product definition, architecture, or risky multi-step work.

### 🏁 Final Checklist Protocol

**Trigger:** When the user says "final checks", "validate", "checklist", or similar phrases.

| Task Stage       | Command                                            | Purpose                        |
| ---------------- | -------------------------------------------------- | ------------------------------ |
| **Daily Doctor** | `python3 .agent/scripts/doctor.py`                 | Fast readiness and next-step guidance |
| **Smart Validate** | `python3 .agent/scripts/smart_validate.py`       | Run only the most relevant checks for current edits |
| **System Audit** | `python3 .agent/scripts/self_check.py .`           | Validate `.agent` consistency  |
| **Manual Audit** | `python3 .agent/scripts/checklist.py .`             | Priority-based project audit   |
| **Pre-Deploy**   | `python3 .agent/scripts/checklist.py . --url <URL>` | Full Suite + Performance + E2E |

**Available Scripts (12 total):**

| Script                     | Skill                 | When to Use         |
| -------------------------- | --------------------- | ------------------- |
| `security_scan.py`         | vulnerability-scanner | Always on deploy    |
| `dependency_analyzer.py`   | vulnerability-scanner | Weekly / Deploy     |
| `lint_runner.py`           | lint-and-validate     | Every code change   |
| `test_runner.py`           | testing-patterns      | After logic change  |
| `schema_validator.py`      | database-design       | After DB change     |
| `ux_audit.py`              | frontend-design       | After UI change     |
| `accessibility_checker.py` | frontend-design       | After UI change     |
| `seo_checker.py`           | seo-fundamentals      | After page change   |
| `bundle_analyzer.py`       | performance-profiling | Before deploy       |
| `mobile_audit.py`          | mobile-design         | After mobile change |
| `lighthouse_audit.py`      | performance-profiling | Before deploy       |
| `playwright_runner.py`     | webapp-testing        | Before deploy       |

### 🎭 Mode Mapping

| Mode     | Agent             | Behavior                                     |
| -------- | ----------------- | -------------------------------------------- |
| **plan** | `project-planner` | 4-phase methodology. NO CODE before Phase 4. |
| **ask**  | -                 | Focus on understanding. Ask questions.       |
| **edit** | `orchestrator`    | Execute. Check `{task-slug}.md` first.       |

---

## TIER 2: DESIGN RULES (Reference)

> **Design rules are in the specialist agents, NOT here.**

| Task         | Read                                   |
| ------------ | -------------------------------------- |
| Web UI/UX    | `.agent/agents/frontend-specialist.md` |
| Mobile UI/UX | `.agent/agents/mobile-developer.md`    |
| Animation    | `.agent/skills/gsap-core/SKILL.md`     |

---

## 📁 QUICK REFERENCE

### Agents & Skills

- **Masters**: `orchestrator`, `project-planner`, `security-auditor`, `backend-specialist`, `frontend-specialist`, `mobile-developer`, `debugger`, `game-developer`
- **Kit Skills (37)**: clean-code, brainstorming, app-builder, frontend-design, mobile-design, plan-writing, behavioral-modes, api-patterns, architecture, database-design, and 27 more
- **OpenSpec Skills (4)**: openspec-propose, openspec-apply-change, openspec-explore, openspec-archive-change
- **GSAP Skills (8)**: gsap-core, gsap-scrolltrigger, gsap-timeline, gsap-react, gsap-frameworks, gsap-plugins, gsap-performance, gsap-utils

### Workflow Commands

- **Kit**: `/plan`, `/create`, `/enhance`, `/debug`, `/test`, `/deploy`, `/orchestrate`, `/brainstorm`, `/preview`, `/status`, `/ui-ux-pro-max`
- **OpenSpec**: `/opsx-propose`, `/opsx-apply`, `/opsx-explore`, `/opsx-archive`

### Key Scripts

- **Verify**: `.agent/scripts/verify_all.py`, `.agent/scripts/checklist.py`
- **Scanners**: `security_scan.py`, `dependency_analyzer.py`
- **Audits**: `ux_audit.py`, `mobile_audit.py`, `lighthouse_audit.py`, `seo_checker.py`
- **Test**: `playwright_runner.py`, `test_runner.py`

---
