# Meta-Skill: Workflow Engineering

This document defines the core principles and standards for the **"Skill Builder"** workflow, specifically for Creating and Refining agent skills in Antigravity.

---

## 💎 1. Core Principles

1.  **Reference Separation Pattern**:
    - Logic (`workflows/*.md`) and Data (`references/*`) MUST be physically separated.
    - Lazy load heavy references only when needed.
2.  **User-Centric Interaction**:
    - Explicitly request inputs and use confirmation gates (`notify_user`).
3.  **Language Separation Strategy 🇰🇷/🇺🇸**:
    - Workflow (`workflows/*.md`): **Korean** (User Readability)
    - Reference (`references/*/SKILL.md`): **English** (Agent Efficiency)
    - Templates (`references/*/*-template.md`): **3-Tier Strategy**
        1.  **Agent-Facing** (e.g. `coding-template`, `doc-template`): **English 🇺🇸**
        2.  **User-Heavy** (e.g. `plan-template`): **Hybrid (KR Headers + EN Logic) 🇰🇷/🇺🇸**
        3.  **User-Light** (e.g. `overview-template`): **Korean 🇰🇷**

---

## 🏗️ 2. Operating Modes (Process)

You MUST identify the mode and then decide the **Reference Source**.

### ✨ Creation Mode
- **Trigger**: "Create a new workflow", "Import this GitHub skill", "I need a skill to automate X"
- **Goal**: Convert an idea OR an external resource into a concrete **"File Set"**.
- **Process**:
    1.  **Search**: Always look for external references (GitHub/Web) first.
    2.  **Adapt**: If found, use `snippet-extractor-guide.md`. If not, use local templates.
- **Definition of Done (DoD)**:
    1.  Create `.agent/workflows/{name}.md` and `.agent/references/{name}/`.
    2.  Create/Adapt `SKILL.md` and link it properly.

### 🔧 Refinement Mode
- **Trigger**: "Refine this workflow", "Update this skill with new standard"
- **Goal**: Resolve structural debt OR upgrade using a better external reference.
- **Process**:
    1.  **Search**: Look for "better ways to do this" externally.
    2.  **Compare**: Check gap between current file and external "Gold Standard".
    3.  **Refactor**: Apply improvements (Reference Separation, etc.).
- **Definition of Done (DoD)**:
    1.  Are inline prompts/templates separated into `references/`?
    2.  Does `SKILL.md` define the Gold Standard?
    3.  Are `task.md` and `notify_user` used appropriately?

---

## 🏆 3. Quality Standards

All workflows must meet the following criteria:

### 1) Reference Separation Pattern
- **Logic vs Data**: Workflow logic (`workflows/*.md`) and Data/Templates (`references/*`) MUST be physically separated.
- **Lazy Loading**: Workflow files should be lightweight and load heavy references via `read_file` only when needed.

### 2) Safe YAML Frontmatter 🛡️
- **Quoting**: The `description` field MUST be wrapped in double quotes `""` if it contains Korean or special characters `(:)`.
    - Bad: `description: 체계적인 디버깅(Systematic)`
    - Good: `description: "체계적인 디버깅(Systematic)"`

### 3) User-Centric Interaction
- **Explicit Inputs**: Clearly request what input is needed from the user.
- **Confirmation Gates**: Use `notify_user` to verify before creating or modifying critical files.

### 3) Self-Contained Context
- The workflow file alone should explain "What this skill does" (Description Header).
- However, knowledge of "How to do it well" is delegated to `SKILL.md`.

---

## ✅ 4. Checklist

Items the agent must self-check during execution:

- [ ] **Mode Check**: Is the user intent Creation or Refinement?
- [ ] **Naming Convention**: Are prefixes like `dev-`, `obsi-` correct? (lowercase, kebab-case)
- [ ] **Path Validation**: Do paths follow the `.agent/` standard structure?
- [ ] **Template Check**: Did you use the Context-Aware Templates?
- [ ] **Validation Pass**: Did `validate_skill.py` return success?
