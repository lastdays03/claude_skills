---
description: "Anthropic의 Best Practice를 기반으로 고성능 프롬프트를 설계하고 최적화합니다."
---

# 🎨 프롬프트 엔지니어링 (Dev Prompt Engineering)

이 워크플로우는 `anthropics/prompt-eng-interactive-tutorial`의 원칙을 사용하여 최적의 Claude 프롬프트를 작성합니다.

## 1. 초기화 (Initialization)
1.  **스킬 로드**: `.agent/references/dev-prompt-engineering/SKILL.md`를 읽어 "Anthropic Best Practices"를 파악합니다.
2.  **목표 설정**: 사용자에게 다음 세 가지를 묻습니다.
    *   **Role**: 에이전트가 어떤 페르소나를 가져야 합니까?
    *   **Task**: 수행해야 할 핵심 작업은 무엇입니까?
    *   **Constraint**: 출력 형식(JSON, XML 등)이나 제약 사항은 무엇입니까?

## 2. 초안 작성 (Drafting - Context & Role)
**"Context First, Instructions Later"**

1.  **구조화**: 입력 데이터를 `<data>`나 `<document>` 태그로 감싸고, 지시사항과 분리합니다.
2.  **페르소나 부여**: 명확한 역할(Role)을 정의하여 프롬프트의 서두에 배치합니다.
3.  **Draft V1**: 초기 프롬프트를 작성하여 사용자에게 보여줍니다.

## 3. 고도화 (Refining - CoT & Few-Shot)
**"생각하게 만들고, 예시를 보여주세요."**

1.  **예시 추가 (Few-Shot)**: 사용자가 원하는 이상적인 입출력 예시를 2~3개 추가합니다.
2.  **CoT 적용**: 복잡한 작업인 경우, `<thinking>` 태그를 사용하여 단계별로 추론하도록 유도합니다. ("Think step-by-step")
3.  **Draft V2**: 개선된 프롬프트를 작성합니다.

## 4. 검증 및 최적화 (Verification)
1.  **시뮬레이션**: 작성된 프롬프트를 에이전트 스스로 평가해봅니다. (Self-Correction)
2.  **Edge Case 점검**: "모르겠으면 모른다고 말해" 등의 환각(Hallucination) 방지 문구가 있는지 확인합니다.
3.  **완료**: 최종 프롬프트를 제공합니다.
