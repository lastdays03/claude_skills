---
name: obsi-knowledge-manager
description: Unified standards for harvesting knowledge from projects and refining it to Gold Standard.
---

# Knowledge Manager Standards

## Core Philosophy
**"Harvesting *IS* Refining"** (이관이 곧 완성이다)
Do not move a note without improving it. Whether moving from a Project or cleaning up an existing concept, the output must always meet the **Gold Standard**.

## Quality Standards (The Gold Standard)
Every note touched by this workflow must meet these criteria:
1.  **Structure**: Must follow `concept-template.md` (Definitions, Examples, Comparisions).
2.  **Clarity**: Definitions must be jargon-free (ELI5) where possible.
3.  **Validation**: Key claims must be backed by official docs or reputable engineering blogs.
4.  **Connectivity**: NO Dead Links. Links must point to valid files in `20_Learning`.
5.  **Multi-modal**: Use code blocks, diagrams (Mermaid), or tables. Text walls are forbidden.

## Operations Manual

### 1. Context Sensing & Mode Selection
- **Case A: Inbox/Project (`99_Inbox`, `10_Projects`)**: Mode is **Harvest**.
    - **Action**: Refine content -> Move to `20_Learning/{Topic}/{Category}`.
- **Case B: Learning Base (`20_Learning`)**: Mode is **Refine**.
    - **Action**: Refine content -> Save in place.

### 2. Refinement Pipeline (Common)
All files undergo this pipeline:

#### A. Notebook Conversion (Deep Analysis)
If input is `.ipynb`:
- **Structure**: Maintain original headers.
- **Code**: Convert to `python` blocks.
- **Outputs**: Capture key outputs (text/dataframe) as text or quotes.
- **Synthesis**: Add "Analysis" comments explaining *why* the code/result matters. 
- **Prohibition**: Do NOT create "wrapper" markdowns that just link to the notebook. The content must be extracted.

#### B. Plan Consolidation
If a `Plan_*.md` or `Overview.md` exists alongside the content:
- **Absorb**: Extract 'Learning Goals', 'Resources', and 'Unresolved Questions'.
- **Inject**: Append to the Main Note's Introduction or "Future Work" section.
- **Delete**: Remove the Plan file to ensure a **Single Source of Truth**.

#### C. Standardization & Enrichment
- **Header Fix**: Apply `concept-template.md` structure.
- **Tag Swap**: `#project/note` -> `#knowledge/topic`.
- **Source Track**: Add `Source: {ProjectName}` to Frontmatter (Plain text, no wikilink).
- **Search**: If content is thin, perform web search to fill "Definition" or "Examples".

### 3. Migration Rules (Harvest Only)
- **Tech Stack**: `20_Learning/10_Topics/Tech_Stack/{Technology}/`
- **Domain**: `20_Learning/10_Topics/Domain/{Field}/`
- **General**: `20_Learning/10_Topics/General/`

### 4. Post-Processing
- **MOC Update**: Always trigger `/obsi-moc-builder` on the target folder.
- **Link Check**: Verify no broken links were created.
