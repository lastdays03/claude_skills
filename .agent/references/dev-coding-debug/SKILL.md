# Skill: Systematic Debugging

This document defines the core principles and quality standards for the **"Dev Coding Debug"** workflow, adopted from `obra/superpowers` "systematic-debugging" skill.
(Agent Instruction: Keep this file in English for better instruction following performance.)

---

## 💎 1. Core Principles (Systematic Debugging)

1.  **Reproduce First**:
    - Never attempt to fix a bug without first creating a reproduction script or test case.
    - If you cannot reproduce it, you cannot verify the fix.
2.  **Root Cause Analysis**:
    - Do not apply "band-aid" fixes to symptoms.
    - Trace the error back to its origin (Root Cause Tracing).
3.  **Atomic Verification**:
    - Verify the fix in isolation before integrating it back into the main codebase.

---

## 🏗️ 2. Workflow Logic (The 4-Phase Process)

The agent must follow this strict loop when debugging:

1.  **reproduction**: Create a minimal reproduction case.
2.  **diagnosis**: Use logs/tracing to find *why* it fails.
3.  **fix**: Apply the correction (TDD: Red -> Green).
4.  **verification**: Run the reproduction script again to confirm the fix.

---

## 🏆 3. Quality Standards

1.  **Test Coverage**: The fix must be covered by a new or updated test.
2.  **No Regression**: Existing tests must still pass.
3.  **Cleanup**: Remove any temporary logging or debug prints added during diagnosis.

---

## ✅ 4. Checklist

- [ ] **Reproduction**: Is there a script that demonstrates the bug?
- [ ] **Root Cause**: Is the underlying reason identified (not just a patch)?
- [ ] **Test Pass**: Does the test pass now?
- [ ] **Linting**: Did you run the linter?
