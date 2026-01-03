# Skill: [Coding Skill Name]

This document defines the core principles and quality standards for the **[Skill Name]** workflow, specifically tailored for **Software Engineering & Coding Tasks**.
(Agent Instruction: Keep this file in English for better instruction following performance.)

---

## 💎 1. Core Principles (Engineering)

1.  **Test-Driven Development (TDD)**:
    - Never write implementation code without a failing test (Red -> Green -> Refactor).
2.  **Systematic Debugging**:
    - Do not guess. Use logs, stack traces, and reproduction scripts to isolate issues.
3.  **Atomic Commits**:
    - Each step should result in a buildable, testable state.

---

## 🏆 2. Quality Standards

1.  **Code Style**: Must follow the project's linter/formatter (e.g., eslint, flake8).
2.  **Error Handling**: All edge cases must be handled gracefully; no silent failures.
3.  **Complexity**: Functions should differ to Single Responsibility Principle.

---

## ✅ 3. Checklist

- [ ] **Test Coverage**: Are there tests for the new feature/fix?
- [ ] **Linting**: Did you run the linter?
- [ ] **Types**: Are type definitions (TypeScript/Python Hints) accurate?
- [ ] **Cleanup**: Are debug prints removed?
