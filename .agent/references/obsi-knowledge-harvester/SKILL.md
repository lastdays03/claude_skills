---
name: obsi-knowledge-harvester
description: Standards for migrating topic notes from Projects/Inbox to the Knowledge Base.
---

# Knowledge Harvester Standards

## Purpose
To curate valuable knowledge from transient project work and move it to a permanent home.

## Migration Rules

### 1. Mapping Logic
- **Tech Stack**: Moves to `20_Learning/10_Topics/Tech_Stack/{Technology}/`
- **Domain Know-How**: Moves to `20_Learning/10_Topics/Domain/{Field}/`
- **General**: Moves to `20_Learning/10_Topics/General/`

### 2. Refactoring on Move
- **Tagging**: Swap `#project/note` -> `#knowledge/topic`.
- **Source Track**: Add `Source: Project Name (Archived)` to frontmatter as **Plain Text**. Do NOT use `[[WikiLink]]` to avoid back-linking to Archive.
- **Trace**: (Optional) Leave a placeholder link if the project still needs it explicitly.
