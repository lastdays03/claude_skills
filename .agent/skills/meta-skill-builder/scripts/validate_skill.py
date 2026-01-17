import os
import sys
import re

def check_kebab_case(name):
    # Allows lowercase letters, numbers, and hyphens.
    return bool(re.match(r'^[a-z0-9]+(-[a-z0-9]+)*$', name))

def validate_skill(skill_name):
    # Assuming the script runs from project root or resources/
    # We try to locate the project root relative to this script or current working dir.
    # For now, presume CWD is project root as is standard in workflows.
    
    base_dir = os.getcwd()
    # Adjust if not in root, but usually agent runs commands from root.
    
    workflow_path = os.path.join(base_dir, ".agent", "workflows", f"{skill_name}.md")
    skill_dir = os.path.join(base_dir, ".agent", "skills", skill_name)
    skill_md_path = os.path.join(skill_dir, "SKILL.md")

    errors = []

    print(f"🔍 Validating Skill: {skill_name}")

    # 1. Naming Convention
    if not check_kebab_case(skill_name):
        errors.append(f"[Naming] Skill name '{skill_name}' must be kebab-case (e.g., dev-coding-debug).")

    # 2. File Structure
    if not os.path.exists(workflow_path):
        errors.append(f"[Structure] Workflow file missing: {workflow_path}")
    else:
        print(f"  ✅ Workflow file found: {workflow_path}")
    
    if not os.path.exists(skill_dir):
        errors.append(f"[Structure] Skill directory missing: {skill_dir}")
    
    if not os.path.exists(skill_md_path):
        errors.append(f"[Structure] SKILL.md missing: {skill_md_path}")
    else:
        print(f"  ✅ SKILL.md found: {skill_md_path}")

    # 3. Content Checks (only if files exist)
    if os.path.exists(skill_md_path):
        with open(skill_md_path, 'r', encoding='utf-8') as f:
            content = f.read()
            # Flexible matching for headers
            required_headers = ["Standards & Rules"]
            for header in required_headers:
                if header not in content:
                    errors.append(f"[Content] SKILL.md missing merged standard section: '{header}'")
            
            # Check for language instruction
            # if "English" not in content and "english" not in content:
            #     print("  ⚠️ [Warning] SKILL.md should usually contain an instruction to keep it in English.")

    if os.path.exists(workflow_path):
        with open(workflow_path, 'r', encoding='utf-8') as f:
            content = f.read()
            # Verify linkage
            if f"Invoke the {skill_name} skill" not in content:
                 errors.append(f"[Linkage] Trigger file does not invoke skill '{skill_name}'")
            
            # YAML Frontmatter Check
            description_match = re.search(r'^description:\s*(.+)$', content, re.MULTILINE)
            if description_match:
                desc_value = description_match.group(1).strip()
                # Check for non-ascii (Korean) characters
                has_non_ascii = any(ord(c) > 127 for c in desc_value)
                if has_non_ascii:
                    if not (desc_value.startswith('"') and desc_value.endswith('"')):
                         errors.append(f"[Frontmatter] Description containing Korean/Special characters must be wrapped in double quotes.\n    Found: {desc_value}")

    if errors:
        print("\n❌ Validation Failed with errors:")
        for e in errors:
            print(f"  - {e}")
        sys.exit(1)
    else:
        print(f"\n✅ Skill '{skill_name}' passed all validation checks.")
        sys.exit(0)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python scripts/validate_skill.py <skill-name>")
        sys.exit(1)
    
    validate_skill(sys.argv[1])
