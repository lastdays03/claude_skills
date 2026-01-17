# Meta-Skill Verification Checklist

Checklist to verify if the workflow created or refined by `meta-skill-builder` complies with the standards.

## 1. Structure Verification
- [ ] **Trigger & Skill Structure**: Is the Trigger (`workflows/*.md`) separated from the Skill Logic (`skills/*/SKILL.md`)?
- [ ] **Naming Convention**: Is the folder/file name in `kebab-case`?
- [ ] **Frontmatter Check**: Is the `description` wrapped in `"double quotes"`? (Critical for Korean text)
- [ ] **Asset Rules**: Are templates/scripts in `resources/` and `scripts/` folders?

## 2. Content Verification
- [ ] **Trigger File (`workflows/*.md`)**:
    - [ ] Is it a minimal "Pure Trigger"? ("Invoke the {name} skill...")
    - [ ] **Language**: Is the description in **Korean**?
- [ ] **SKILL File (`skills/*/SKILL.md`)**:
    - [ ] Does it contain the **Execution Steps** (Manual)?
    - [ ] Does it contain **Standards & Rules**?
    - [ ] **Language**: Is the logic/standards in **English**?
## 3. Discovery Verification (New Skill Only)
- [ ] **Source Tier**: Did you check Tier 1 (Official) sources first?
- [ ] **Quality Check**: Does the source logic include CoT or specific examples?
- [ ] **Adaptation**: Did you consolidate logic into `SKILL.md` and keep assets relative?

## 4. Integration Verification
- [ ] **Path Correctness**: Do file paths use relative paths (`resources/...`) where possible?
- [ ] **Self-Description**: Does the trigger description match the actual task performed?
