# Document Context Specification: 2026 Roadmap

## 1. Document Type
- **Format**: Word (`.docx`), Excel (`.xlsx`), PDF (`.pdf`)
- **Library**: `docxtpl`, `openpyxl`, `WeasyPrint`

## 2. Template Variables (Context)

| Variable Name | Type | Description | Example |
| :--- | :--- | :--- | :--- |
| `{{ roadmap_title }}` | String | Title of the roadmap | "2026 Claude Skills 통합 계획" |
| `{{ goal_description }}` | String | Summary of the goal | "2026년 추천 스킬 Top 10을 도입하여..." |
| `{{ phases }}` | List[Dict] | List of roadmap phases | `[{'name': 'Phase 1', 'items': [...]}]` |
| `{{ item.name }}` | String | Name of the skill | "dev-coding-debug" |
| `{{ item.source }}` | String | Source repository | "obra/superpowers" |
| `{{ item.role }}` | String | Role of the skill | "Debugging & TDD" |

## 3. Logic Requirements
- **Word**: Loop through `phases` and `items` to list skills.
- **Excel**: Create a table with columns [Phase, Skill Name, Source, Role].
- **PDF**: Render a clean HTML report with the same data.
