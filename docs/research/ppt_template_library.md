# PPT Template Library & Resources 🎨

사용 가능한 고품질 무료 PPT 템플릿과 리소스를 정리했습니다.
코드로 디자인을 생성하는 것보다, 아래의 "검증된 템플릿"을 다운로드하여 `templates/` 폴더에 넣고 사용하는 것이 훨씬 효과적입니다.

## 1. Top Recommended Sources (무료/고품질)

| Site Name | Style | Pros | URL |
| :--- | :--- | :--- | :--- |
| **SlidesCarnival** | Corporate / Minimal | 가입 불필요, 즉시 다운로드 가능. 디자인이 매우 깔끔함. | [Link](https://www.slidescarnival.com/category/free-templates/business-templates) |
| **Slidesgo** | Modern / Creative | 트렌디한 디자인 많음. (하루 무료 다운로드 제한 있음) | [Link](https://slidesgo.com/business) |
| **Microsoft Create** | Standard / Official | MS 공식 템플릿. 호환성 100%. | [Link](https://create.microsoft.com/en-us/powerpoint-templates) |

## 2. GitHub Open Source Templates
개발자 친화적인 템플릿 리소스입니다.

*   **GBIF PPT Template**: `gbif/ppt-template`
    *   깔끔한 기관용 템플릿 (.potx). 차트 및 아이콘 포함.
    *   [GitHub Link](https://github.com/gbif/ppt-template)
*   **Catppuccin Slides**: `catppuccin/powerpoint-slides`
    *   파스텔 톤의 개발자 선호 테마.
    *   [GitHub Link](https://github.com/catppuccin/powerpoint-slides)

## 3. Recommended Action (추천 워크플로우)

1.  **Select**: 위 사이트에서 마음에 드는 `.pptx` 파일을 다운로드합니다.
2.  **Save**: `.agent/references/biz-doc-generator/templates/` 폴더에 저장합니다.
    *   예: `company_theme.pptx`
3.  **Config**: `generate_value_chain_ppt.py`의 `TEMPLATE_PATH`를 해당 파일로 변경합니다.

```python
# generate_value_chain_ppt.py
TEMPLATE_PATH = ".agent/references/biz-doc-generator/templates/company_theme.pptx"
```

## 4. Quick Starter (임시 사용)
당장 다운로드가 귀찮으시다면, 아래의 "미니멀리스트" 스타일을 코드로 생성해드릴 수 있습니다. (하지만 외부 템플릿이 품질은 압도적입니다.)
