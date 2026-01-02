# 분석 계획서 (Analysis Plan): [Topic Name]

**Date**: YYYY-MM-DD
**Analyst**: [Name]
**Status**: 🔄 In Progress

---

## 1. 목표 설정 (Goal Setting)
*명확한 분석 목적이 없다면 시작하지 마십시오.*

- **Question**: 해결하고자 하는 비즈니스/기술적 질문은 무엇인가요?
- **Utility**: 이 분석이 성공하면 무엇이 바뀌나요? (의사결정, 성능 향상 등)
- **Success Metrics (KPI)**:
    - [ ] [Metric 1] (e.g., False Positive Rate < 5%)
    - [ ] [Metric 2] (e.g., Inference Time < 100ms)

---

## 2. 방법론 (Methodology)
*(Optional) 사용할 주요 기법이나 모델*

- **Type**: EDA / Predictive Modeling / Causal Inference
- **Tools**: Pandas, Seaborn, Scikit-learn, [Other Libs]
- **Target Variable**: [Column Name] (if supervised)

---

## 3. 검증 가설 (Hypothesis to Validate)
*탐색적 데이터 분석(EDA)에서 검증할 주요 가설들*

1.  **H1**: [성별에 따라 생존율에 유의미한 차이가 있을 것이다.]
2.  **H2**: [가격과 판매량 사이에는 역의 상관관계가 존재할 것이다.]
3.  **H3**: [...]

---

## 4. 예상 산출물 (Expected Deliverables)
- [ ] **Notebook**: `EDA_01_[Topic].ipynb` (Clean outputs)
- [ ] **Insight Report**: 주요 발견점 및 Action Item 제안
- [ ] **Model Artifact**: (If modeling) Saved model file (.pkl)
