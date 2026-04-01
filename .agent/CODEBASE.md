# 📋 Codebase Map

> Auto-maintained by the AI. Updated when significant files are created, modified, or deleted.
> **Read this before modifying files** to understand dependencies and avoid breaking changes.

---

## 🏗️ Project Structure

- `.agent/agents/` → specialist execution roles and orchestration personas
- `.agent/skills/` → reusable domain knowledge and validation capabilities
- `.agent/workflows/` → slash-command style operating procedures
- `.agent/rules/` → global behavior and routing rules
- `.agent/scripts/` → shared automation for validation, preview, and session state

---

## 📦 Key Files & Dependencies

- `rules/GEMINI.md` → global source of truth for routing, questioning, validation, and session behavior
- `ARCHITECTURE.md` → high-level system map used by orchestrator and future sessions
- `agents/orchestrator.md` → decision engine that bridges direct execution, planning, and orchestration
- `workflows/orchestrate.md` → execution contract for multi-agent tasks
- `scripts/checklist.py` → incremental validation entry point
- `scripts/verify_all.py` → full verification entry point

---

## 🔗 Dependency Graph (Critical Paths)

- `rules/GEMINI.md` → affects all agents, workflows, and the expected operating model
- `agents/orchestrator.md` → affects routing behavior, OpenSpec escalation, and agent selection
- `ARCHITECTURE.md` → affects onboarding, system understanding, and operator trust
- `scripts/checklist.py` and `scripts/verify_all.py` → affect day-to-day quality gates and deploy confidence

---

## 🎯 Entry Points

| Context | Entry Point | Notes |
|---------|------------|-------|
| Global behavior | `.agent/rules/GEMINI.md` | Read first for universal rules |
| System overview | `.agent/ARCHITECTURE.md` | Best starting point for humans and orchestrators |
| Daily execution | `.agent/agents/orchestrator.md` | Main decision engine |
| Manual validation | `.agent/scripts/checklist.py` | Fast audit during active development |
| Release validation | `.agent/scripts/verify_all.py` | Full suite before deploy |

---

## 🧩 Shared Modules

| Module | Used By | Change Impact |
|--------|---------|--------------|
| `GEMINI.md` | All agents and workflows conceptually depend on it | High |
| `ARCHITECTURE.md` | Orchestrator, onboarding, maintenance work | High |
| Validation scripts | Workflows, agents, manual review flow | High |

---

## 📝 API Surface

| Method | Route | Handler | Auth |
|--------|-------|---------|------|
| N/A | N/A | `.agent` is an instruction and automation system, not an app API | N/A |

---

<!--
MAINTENANCE RULES (for AI):
- Update when: new files created, files deleted, imports changed significantly
- Only track files with 2+ dependents (don't track leaf files)
- Max 300 lines — prune low-impact entries
- Re-scan on user request: "update codebase map" or "scan project"
- Silent updates — don't announce changes to user
-->
