---
description: "체계적인 디버깅(Systematic Debugging) 절차를 통해 버그의 원인을 찾고 해결합니다. (Source: obra/superpowers)"
---

# 🐞 개발 디버깅 (Dev Coding Debug)

이 워크플로우는 `obra/superpowers`의 체계적 디버깅(Systematic Debugging) 방법론을 사용하여, 복잡한 버그를 빈틈없이 해결하도록 돕습니다.

## 1. 초기화 (Initialization)

1.  **스킬 로드**: `.agent/references/dev-coding-debug/SKILL.md`를 읽어 디버깅 원칙을 파악합니다.
2.  **상황 파악**: 사용자에게 현재 겪고 있는 문제 현상(Symptom)과 예상되는 원인을 묻습니다.

## 2. 재현 (Reproduction - Phase 1)

**"재현되지 않는 버그는 고칠 수 없습니다."**

1.  **재현 스크립트 작성**: 버그를 확실하게 발생시키는 최소 단위의 코드(Reproduction Script)를 작성합니다.
2.  **실행 및 확인**: 스크립트를 실행하여 실패(Red)하는지 확인합니다.

## 3. 진단 (Diagnosis - Phase 2)

**"증상이 아니라 원인을 찾으세요."**

1.  **로그 추가**: 의심가는 지점에 로그를 추가하거나 디버거를 사용합니다.
2.  **추적 (Root Cause Tracing)**: 에러 발생 지점부터 역추적하여 근본 원인을 찾아냅니다.
3.  **가설 검증**: 원인에 대한 가설을 세우고, 이를 검증합니다.

## 4. 해결 (Fix - Phase 3)

1.  **코드 수정**: 원인을 제거하는 코드를 작성합니다.
2.  **TDD 원칙**: 수정 후 재현 스크립트가 성공(Green)하는지 확인합니다.

## 5. 검증 및 정리 (Verification - Phase 4)

1.  **회귀 테스트**: 기존 테스트들이 여전히 통과하는지 확인합니다.
2.  **정리 (Cleanup)**: 디버깅을 위해 추가했던 로그나 임시 코드를 제거합니다.
3.  **체크리스트**: `SKILL.md`의 체크리스트를 확인하고 완료를 선언합니다.
