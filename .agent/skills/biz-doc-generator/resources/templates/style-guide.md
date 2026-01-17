# Document Style Guide (Korean Support) 🇰🇷

## 1. Common Standards
- **Language**: Korean (Primary), English (Secondary)
- **Date Format**: `YYYY-MM-DD` (Standard), `YYYY년 MM월 DD일` (Formal)

## 2. PDF / HTML Style (WeasyPrint)
To prevent "tofu" (□□□) characters, explicit font declaration is required.

```css
@font-face {
    font-family: 'NanumGothic';
    src: url('/usr/share/fonts/truetype/nanum/NanumGothic.ttf'); /* Adjust path */
}

body {
    font-family: 'NanumGothic', sans-serif;
}
```

## 3. Excel Style (openpyxl)
- **Header**: Bold, Center Align, Light Gray Background (`DDDDDD`).
- **Numbers**: Comma separated (`#,##0`), Right Align.

## 4. Word Style (docxtpl)
- Rely on the **Styles** defined in the `.docx` template (e.g., "Heading 1", "Normal").
- Do not hard-code font sizes in Python unless absolutely necessary.
