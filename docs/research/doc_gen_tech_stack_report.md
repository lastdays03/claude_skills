# Tech Stack Recommendation for Document Gen Agent 📄🛠️

> **Executive Summary**
> 기업용 문서 생성 에이전트를 위한 "Golden Stack"으로 **Template-First 접근**을 권장합니다.
> Word는 `docxtpl`로 Jinja2 템플릿을 활용하고, Excel은 `openpyxl`로 기존 양식을 수정하며, PDF는 `WeasyPrint`나 `Playwright`를 통해 HTML을 변환하는 것이 가장 현대적이고 유지보수하기 좋습니다.
> **한글 폰트(Korean Font)** 깨짐 문제는 PDF 생성 시 가장 주의해야 하며, 시스템 폰트(TTF)를 명시적으로 로드하는 것이 필수입니다.

---

## 1. Detailed Analysis by Format

### A. Word (.docx) 📝
Word 문서는 "처음부터 코드로 그리는 것"보다 "잘 만들어진 양식(Template)에 데이터만 끼워 넣는 것"이 훨씬 효율적입니다.

| Library | Pros (장점) | Cons (단점) | Verdict |
| :--- | :--- | :--- | :--- |
| **`docxtpl`** | **Jinja2** 문법 사용 (if, for 등)으로 템플릿 제어 용이. 기존 스타일 완벽 보존. | 템플릿 파일(.docx)이 반드시 필요함. | **Winner** 🏆 |
| `python-docx` | 문서 구조(단락, 표)를 코드로 세밀하게 제어 가능. | 복잡한 서식을 코드로 일일이 구현하기 난해함. | Base Library |

**Recommendation**: **`docxtpl`**
AI 에이전트가 코드를 생성할 때, 디자인(Styles)과 로직(Data Injection)을 분리할 수 있어 할루시네이션 위험이 적습니다. `python-docx`는 `docxtpl`의 기반 라이브러리이므로 필요 시 내부 객체 조작용으로 함께 사용합니다.

### B. Excel (.xlsx) 📊
데이터의 양과 "수정 여부"에 따라 선택이 갈립니다.

| Library | Pros (장점) | Cons (단점) | Verdict |
| :--- | :--- | :--- | :--- |
| **`openpyxl`** | **Read/Write** 모두 가능. 기존 파일 수정 시 유일한 대안. | 대용량 처리 시 속도 느림. | **Primary** 🏆 |
| `xlsxwriter` | 쓰기 속도 빠름. 차트 및 복잡한 서식(Conditional Formatting) 지원 우수. | **Write-Only** (기존 파일 수정 불가). | Secondary |
| `pandas` | 데이터 분석 및 변환에 최강. | 서식(Style) 제어 기능이 거의 없음. | ETL Tool |

**Recommendation**: **`openpyxl`**
기업 환경에서는 "기존 월간 보고서 양식"에 수치만 업데이트하는 경우가 많으므로 읽기/쓰기가 모두 되는 `openpyxl`이 필수입니다. 신규 리포트 생성 시에는 화려한 차트 지원을 위해 `xlsxwriter`를 검토할 수 있습니다.

### C. PowerPoint (.pptx) 📢
대안이 많지 않은 영역입니다.

| Library | Pros (장점) | Cons (단점) | Verdict |
| :--- | :--- | :--- | :--- |
| **`python-pptx`** | 사실상 표준(De-facto). 슬라이드, 텍스트, 차트 조작 가능. | 복잡한 애니메이션이나 정교한 레이아웃 제어는 어려움. | **Winner** 🏆 |
| `TemplatePpptx` | `python-pptx` 기반으로 템플릿 치환 기능 강화. | 커뮤니티 지원이 적음. | Optional |

**Recommendation**: **`python-pptx`**
복잡한 레이아웃은 마스터 슬라이드(Master Slide)에 미리 잡아두고, Python으로는 텍스트/이미지 홀더(Placeholders)에 내용만 채워 넣는 방식을 권장합니다.

### D. PDF Generation 📑
가장 트렌드가 많이 변하고 있는 영역입니다.

| Library | Pros (장점) | Cons (단점) | Verdict |
| :--- | :--- | :--- | :--- |
| **`WeasyPrint`** | **HTML/CSS to PDF**. 웹 개발 기술 재사용 가능. 스타일링 쉬움. | JS 실행 불가. 복잡한 동적 차트 렌더링 제한. | **Static King** 🏆 |
| `Playwright` | **Headless Browser**. JS/Chart 완벽 지원. 보이는 그대로 출력. | 브라우저 설치 필요(무거움). | Dynamic King |
| `ReportLab` | 픽셀 단위 정밀 제어. | 코드가 어렵고 유지보수 힘듦(Old School). | Legacy |

**Recommendation**: **`WeasyPrint`** (Static) or **`Playwright`** (Dynamic)
"HTML로 템플릿을 만들고 PDF로 굽는 것"이 최신 트렌드입니다. 특히 **한글 폰트** 문제 해결 시, CSS `@font-face`로 폰트를 지정하는 것이 ReportLab의 복잡한 폰트 등록 과정보다 훨씬 직관적입니다.

---

## 2. Architecture Pattern Suggestion (제안 아키텍처)

**"Template-First Pipeline"** 구조를 제안합니다.

1.  **Templates Repository**: 디자이너/기획자가 만든 `.docx`, `.xlsx`, `.html` 템플릿을 관리.
2.  **Context Generator (Agent)**: 사용자의 질문/데이터를 분석하여 JSON 형태의 Context(변수) 생성.
3.  **Rendering Engine**:
    *   Word: `docxtpl` + Context
    *   Excel: `openpyxl` + Context
    *   PDF: `Jinja2 (HTML)` -> `WeasyPrint`
4.  **Delivery**: 최종 산출물을 다운로드 링크나 이메일로 전송.

이 방식은 AI가 "디자인"에 신경 쓰지 않고 "데이터"에만 집중하게 하여 성능과 품질을 동시에 잡을 수 있습니다.

---

## Appendix: Search Log (탐색 일지)

| Search Query (키워드) | Visited URL (요약) | Tool Used | Status |
| :--- | :--- | :--- | :--- |
| `python-docx vs docxtpl comparison 2024` | `medium.com`, `pypi.org` - `docxtpl`이 템플릿 처리에 우수함 확인 | `search_web` | ✅ |
| `openpyxl vs xlsxwriter vs xlwings` | `sheetflash.com` - `openpyxl`은 수정 가능, `xlsxwriter`는 쓰기 전용 | `search_web` | ✅ |
| `python-pptx alternatives` | `softkraft.co` - `python-pptx`가 표준이나 복잡도는 제한적 | `search_web` | ✅ |
| `best python pdf generation library 2024` | `pdfnoodle.com` - ReportLab vs WeasyPrint vs Playwright 비교 | `search_web` | ✅ |
| `python pdf 한글 폰트 깨짐` | `antilibrary.org` - ReportLab은 TTF 등록, WeasyPrint는 CSS 폰트 필요 | `search_web` | ✅ |
