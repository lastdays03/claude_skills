# Research: Corporate Value Chain & AI Agent Integration Analysis 🏢🤖

이 문서는 기업의 업무 프로세스(Value Chain)를 분석하고, AI 에이전트(Claude Skills)가 어떻게 기여할 수 있는지에 대한 **리서치 및 분석 자료**입니다. 특히 산업군별(Industry Specific) 프로세스 차이를 반영하여 에이전트 활용 기회를 세분화했습니다.

---

## 1. General Value Chain Framework (공통 업무 프로세스)

모든 기업은 본질적으로 "가치 창출(Value Creation)"을 위해 4단계의 공통 프로세스를 거칩니다.

| Phase | 단계 (Stage) | 핵심 목표 (Core Goal) |
| :--- | :--- | :--- |
| **P1** | **전략/기획 (Strategy)** | 불확실성 감소 및 비즈니스 방향 설정 |
| **P2** | **실행/생산 (Execution)** | 제품 또는 서비스의 구체적 구현 |
| **P3** | **마케팅/영업 (GTM)** | 고객에게 가치 전달 및 수익 창출 |
| **P4** | **운영/지원 (Support)** | 효율 최적화 및 지속 가능성 확보 |

---

## 2. Industry-Specific Value Chains (산업군별 프로세스 심층 분석)

산업의 특성에 따라 '실행(Execution)'과 '전달(Delivery)'의 방식이 완전히 다르므로, 에이전트의 역할도 달라져야 합니다.

### Type A: Software / SaaS (소프트웨어 및 플랫폼) 💻
*   **특징**: 무형의 자산(IP)이 핵심이며, 개발-배포-운영이 무한 반복되는 **DevOps** 사이클이 중심입니다.
*   **Key Value Chain**:
    1.  **Product Planning**: 사용자 피드백 기반 기능 기획.
    2.  **R&D (Agile)**: 설계 -> 코딩 -> 테스트 -> 배포의 빠른 반복.
    3.  **Growth Hacking**: 데이터 기반의 마케팅 및 유저 확보 (PLG: Product-Led Growth).
    4.  **Customer Success**: 구독 갱신(Retention)을 위한 온보딩 및 기술 지원.

#### 🤖 Agent Opportunities (For SaaS)
*   **Feature Planner**: 모호한 아이디어를 PRD(제품 요구사항 정의서)로 변환.
*   **Coding Partner**: 코드 생성, 리팩토링, 테스트 코드 자동화.
*   **Review Analyst**: 앱스토어/커뮤니티 리뷰를 분석하여 버그 및 개선점 도출.
*   **Retention Guardian**: 사용 로그를 분석하여 이탈 위험군 탐지 및 이메일 초안 작성.

---

### Type B: Manufacturing (제조업) 🏭
*   **특징**: 유형의 자산(설비, 재고) 관리가 핵심이며, **Supply Chain Management (SCM)**가 효율을 결정합니다.
*   **Key Value Chain**:
    1.  **R&D & Engineering**: 제품 도면 설계 및 공정 설계.
    2.  **Procurement (소싱)**: 원자재 구매 및 공급망 관리.
    3.  **Production (공정)**: 생산 계획 수립, 조립, 품질 관리(QC).
    4.  **Logistics (물류)**: 재고 보관 및 배송.

#### 🤖 Agent Opportunities (For Mfg)
*   **Procurement Assistant**: 원자재 가격 변동 추적 및 최적 구매 시기 제안.
*   **QC Monitor**: 품질 검사 리포트의 이상 징후를 텍스트로 요약/알림.
*   **Safety Officer**: 작업 현장 안전 규정(매뉴얼) 검색 및 준수 여부 체크리스트 생성.
*   **Inventory Forecaster**: 판매 데이터를 기반으로 안전 재고량 예측 리포트 생성.

---

### Type C: Professional Services (컨설팅, 에이전시, 로펌) 🤝
*   **특징**: 사람의 전문성(Human Capital)이 상품이며, **Project Management**와 **Relationship**이 핵심입니다.
*   **Key Value Chain**:
    1.  **Proposal (수주)**: 고객 니즈 파악 및 제안서 작성 (가장 중요).
    2.  **Engagement (수행)**: 전문 지식을 활용한 용역 수행 및 산출물 작성.
    3.  **Client Mgmt**: 고객 관계 유지 및 추가 계약 유도.
    4.  **Knowledge Mgmt**: 프로젝트 경험의 자산화.

#### 🤖 Agent Opportunities (For Services)
*   **Proposal Composer**: 고객의 RFP(제안요청서)를 분석하여 맞춤형 제안서 초안 작성.
*   **Research Assistant**: 프로젝트 수행에 필요한 규제, 판례, 시장 자료 수집.
*   **Meeting Scribe**: 클라이언트 미팅 녹취록 요약 및 Action Item 추출.
*   **Knowledge Harvester**: 완료된 프로젝트 산출물에서 재사용 가능한 템플릿 추출.

---

## 3. Planning Methodologies (기획 에이전트 공통 방법론)

산업군은 다르지만, 모든 **Phase 1 (전략/기획)** 단계에서는 공통적으로 '설득의 논리'가 필요합니다.

### A. Minto Pyramid Principle (민토 피라미드)
*   **Concept**: 핵심 아이디어(결론)를 최상단에 배치하고, 그 근거를 그룹핑하여 구조화.
*   **Use Case**: 사업계획서, 제안서, 보고서 작성 시 두괄식 구성을 강제.

### B. SCQA Framework (스토리텔링)
*   **Concept**: Situation(상황) → Complication(위기/문제) → Question(질문) → Answer(해결책).
*   **Use Case**: 제안서나 발표 자료(Pitch Deck)의 도입부에서 흥미 유발.
