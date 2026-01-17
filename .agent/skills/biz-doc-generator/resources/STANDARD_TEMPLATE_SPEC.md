# Standard Business Template Specification
**File**: `resources/templates/standard_biz_template.pptx` (GBIF)

This template requires specific handling due to its non-standard layout indexing and inclusion of instructional slides.

## 1. Layout Indices
When adding slides using `prs.slide_layouts[i]`, use the following mapping:

| Layout Name | Index | Placeholder Mapping |
| :--- | :--- | :--- |
| **Title Slide** (Title 1) | **8** | Title: `0`, Subtitle/Body: `13` |
| **Standard Content** (Título y objetos) | **3** | Title: `0`, Content Body: `13` |
| **3 Column Content** | **4** | Title: `0`, Cols: `22`, `23`, `24` |
| **Section Header** | **32** | Title: `0` |
| **Blank** | **36** | - |

> [!WARNING]
> Do NOT assume `Layout 0` is the Title Slide. In this template, `Layout 0` is "Image right".

## 2. Template Hygiene (Cleanup)
This template contains pre-existing instructional slides (e.g., "Delete before presenting").
**You MUST remove them programmatically before adding your own slides.**

### Python Snippet for Cleanup
```python
# Remove all existing slides SAFELY (iterating backwards)
if len(prs.slides) > 0:
    for i in range(len(prs.slides) - 1, -1, -1):
        rId = prs.slides._sldIdLst[i].rId
        prs.part.drop_rel(rId)
        del prs.slides._sldIdLst[i]
```

## 3. Font & Style
- **Fonts**: The template uses standard fonts but ensure Korean text is handled gracefully.
- **Colors**: Uses GBIF Green/Blue palette. Do not override theme colors manually unless necessary.
