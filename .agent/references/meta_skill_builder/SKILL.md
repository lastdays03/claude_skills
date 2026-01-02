# Meta-Skill: Workflow Engineering

This document defines the core principles and standards for the **"Skill Builder"** workflow, specifically for Creating and Refining agent skills in Antigravity.

---

## 🏗️ 1. Two Modes of Operation

This skill operates in two modes. You MUST identify and declare the mode at the start of the process.

### ✨ Creation Mode
- **Trigger**: "Create a new workflow", "I need a skill to automate X"
- **Goal**: Convert a user's vague idea into a concrete **"File Set"**.
- **Definition of Done (DoD)**:
    1.  Create `.agent/workflows/{name}.md` (Orchestrator).
    2.  Create `.agent/references/{name}/` directory.
    3.  Create and link essential reference files like `SKILL.md` and `template.md`.

### 🔧 Refinement Mode
- **Trigger**: "Refine this workflow", "Refactor this skill"
- **Goal**: Resolve structural debt in an existing workflow and apply the **"Reference Separation Pattern"**.
- **Definition of Done (DoD)**:
    1.  Are inline prompts/templates separated into `references/`?
    2.  Does `SKILL.md` define the Gold Standard?
    3.  Are `task.md` and `notify_user` used appropriately?

---

## 💎 2. Core Quality Standards (The "Rule of Thumb")

All workflows created or refined by this skill must meet the following criteria:

### 1) Reference Separation Pattern
- **Logic vs Data**: Workflow logic (`workflows/*.md`) and Data/Templates (`references/*`) MUST be physically separated.
- **Lazy Loading**: Workflow files should be lightweight and load heavy references via `read_file` only when needed.

### 2) User-Centric Interaction
- **Explicit Inputs**: Clearly request what input is needed from the user.
- **Confirmation Gates**: Use `notify_user` to verify before creating or modifying critical files.

### 3) Self-Contained Context
- The workflow file alone should explain "What this skill does" (Description Header).
- However, knowledge of "How to do it well" is delegated to `SKILL.md`.

### 4) Language Separation Strategy 🇰🇷/🇺🇸
- **Workflow (`workflows/*.md`)**: **Korean**
    - Purpose: User readability.
- **Reference (`references/*/SKILL.md`)**: **English**
    - Purpose: Agent efficiency.
- **Templates (`references/*/*-template.md`)**: **3-Tier Strategy**
    1.  **Agent-Facing** (e.g. `skill-template`): **English 🇺🇸**
    2.  **User-Heavy** (e.g. `plan-template`): **Hybrid (KR Headers + EN Logic) 🇰🇷/🇺🇸**
    3.  **User-Light** (e.g. `overview-template`): **Korean 🇰🇷**

---

## 🛠️ 3. Execution Checklist

Items the agent must self-check during execution:

- [ ] **Mode Check**: Is the user intent Creation or Refinement? (Declare ✨/🔧)
- [ ] **Naming Convention**: Are prefixes like `dev_`, `obsi_` correct? (lowercase, snake_case)
- [ ] **Path Validation**: Do paths follow the `.agent/` standard structure?
- [ ] **Import Check**: Does the workflow file include a step to load `SKILL.md`?
- [ ] **Template Check**: Are templates following the 3-Tier Language Strategy? (See above)
