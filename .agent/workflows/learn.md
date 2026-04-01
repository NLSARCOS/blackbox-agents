---
description: Auto-extracts established project knowledge into a new reusable skill.
---

# 🧠 Self-Learning Extraction (/learn)

This workflow extracts project-specific knowledge, recurring patterns, or user preferences into a dedicated `.agent/skills/` directory so the AI operates flawlessly in future sessions.

### Step 1: Identify the Knowledge
- Analyze the user request or recent conversation history.
- Identify the core principles, anti-patterns, or project-specific rules that need to be memorized.

### Step 2: Extract the Skill
- Determine a concise, hyphenated name for the project skill (e.g., `project-auth-flow`, `ayvens-design-system`).
- Create a new directory at `.agent/skills/<skill-name>/`.
- Create `.agent/skills/<skill-name>/SKILL.md` using the standard YAML frontmatter format:
```yaml
---
name: [Skill Name]
description: [Short description of when to use this project-specific skill]
---
```
- Write the Markdown rules clearly. Focus on "Principles, not copying" and include concrete code examples based on the user's codebase.

### Step 3: Register the Learning
- Silently update `.agent/MEMORY.md` to note that the new skill was created.
- Announce to the user: "🧠 *He extraído este conocimiento en un nuevo skill (`[skill-name]`). A partir de ahora lo aplicaré automáticamente cuando trabajemos en esto.*"

### Step 4: Validate
Ensure the created files don't break the system structure:
```bash
python3 .agent/scripts/self_check.py .
```
