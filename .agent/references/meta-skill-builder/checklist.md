# Meta-Skill Verification Checklist

Checklist to verify if the workflow created or refined by `meta-skill-builder` complies with the standards.

## 1. Structure Verification
- [ ] **Reference Separation**: Is workflow logic (`.agent/workflows/*.md`) separated from knowledge (`.agent/references/*`)?
- [ ] **Naming Convention**: Is the folder/file name in `kebab-case`?
- [ ] **Frontmatter Check**: Is the `description` wrapped in `"double quotes"`? (Critical for Korean text)
- [ ] **Structure Check**: Does it contain `SKILL.md` and `workflow.md`?

## 2. Content Verification
- [ ] **Workflow File**:
    - [ ] Is the Frontmatter (`--- description ---`) present?
    - [ ] Is there a step explicitly loading (`read_file`) the `SKILL.md`?
    - [ ] Is there a step to update `task.md`?
    - [ ] **Language**: Is it written in **Korean**?
- [ ] **SKILL File**:
    - [ ] Are core principles and quality standards clearly defined?
    - [ ] Is a checklist included?
    - [ ] **Language**: Is it written in **English**?

## 3. Integration Verification
- [ ] **Path Correctness**: Do file paths accurately point to the Antigravity standard (`.agent/...`)?
- [ ] **Self-Description**: Does the workflow description match the actual task performed?
