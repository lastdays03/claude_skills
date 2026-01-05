---
description: "데이터 분석/머신러닝 노트북의 결과를 분석하여 표준화된 Model Card 보고서(Markdown)를 자동 생성합니다."
---

# Model Card Reporter Workflow

이 워크플로우는 **Jupyter Notebook**의 분석 결과를 추출하여, **Hugging Face/Google 표준**에 부합하는 Model Card 문서를 생성합니다.

### 1단계: 대상 선정 (Selection)
1.  **Input**: 사용자가 분석하려는 **노트북 파일 경로**(`*.ipynb`)를 입력받습니다.
2.  **Context Loading**: `.agent/references/data-model-reporter/SKILL.md`를 읽어 추출 규칙과 표준을 로드합니다.

### 2단계: 추출 및 분석 (Extraction)
1.  **Read Notebook**: `read_file`로 노트북 내용을 읽습니다 (JSON 포맷 파싱).
2.  **Analyze**:
    *   **Model**: 사용된 모델(알고리즘, 프레임워크 버전)을 식별합니다.
    *   **Metrics**: `accuracy_score`, `f1_score` 등 정량적 지표의 실행 결과를 찾습니다.
    *   **Features**: `X.columns`, `feature_importances_` 등을 통해 주요 변수를 추출합니다.

### 3단계: 리포트 작성 (Drafting)
1.  **Template Load**: `.agent/references/data-model-reporter/report-template.md`를 로드합니다.
2.  **Fill**: 추출된 정보를 바탕으로 템플릿의 빈칸(`{...}`)을 채웁니다.
    *   **Warning**: '윤리적 고려사항'이나 '사용 목적'처럼 코드에서 알 수 없는 내용은 "사용자 입력 필요"로 표시하거나, 노트북의 마크다운 셀에서 문맥을 추론합니다.
3.  **Create Artifact**: `model_card.md` (또는 유사한 이름) 아티팩트를 생성합니다.

### 4단계: 검토 및 완료 (Review)
1.  **Notify**: 생성된 리포트 경로를 사용자에게 알리고, **"윤리적 고려사항"** 섹션을 반드시 수동으로 검토할 것을 안내합니다.
