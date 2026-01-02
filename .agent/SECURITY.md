# Antigravity Security Profiles & Settings

이 문서는 Antigravity 에이전트의 보안 및 권한 설정에 대한 권장 프로필을 정의합니다. 프로젝트의 성격과 민감도에 따라 적절한 프로필을 선택하여 적용하세요.

---

## 🛡️ 프로필 요약 (Profile Summary)

| 프로필                  | 특징                                 | 권장 대상                                 |
| :---------------------- | :----------------------------------- | :---------------------------------------- |
| **Level 1: Strict**     | **최고 보안**. 자율성 최소화.        | 핀테크, 개인정보 취급, 외주 프로젝트      |
| **Level 2: Balanced**   | **권장 설정**. 보안과 생산성의 균형. | 사내 프로젝트, 일반적인 팀 협업           |
| **Level 3: Efficiency** | **최대 효율**. 높은 자율성.          | 개인 학습, 토이 프로젝트, 격리된 샌드박스 |

---

## 1. Level 1: Strict Security (보안 최우선)

**"AI의 자율성을 통제하고 데이터 유출 가능성을 원천 차단합니다."**

### ✅ Key Settings
| 설정 항목 (Settings)                | 값 (Value)       |
| :---------------------------------- | :--------------- |
| **Agent Gitignore Access**          | `OFF`            |
| **Agent Non-Workspace File Access** | `OFF`            |
| **Browser / Web Tools**             | `OFF`            |
| **Terminal Command Auto Execution** | `Request Review` |

### 🚫 Terminal Deny List (접근 차단 명령어)
*모든 위험 명령어를 사전에 차단 등록합니다.*
```bash
# 삭제 및 초기화 (매우 위험)
rm -rf, git clean -fd, docker-compose down -v, docker system prune
# 시스템 권한 및 소유권
sudo, chmod, chown, visudo
# 원격 저장소 강제 조작
git push -f, git push --force, git reset --hard
# 인프라 변경 및 삭제
terraform destroy, aws s3 rm --recursive
# 프로세스 종료 및 시스템 제어
kill -9, shutdown, reboot
# 인터넷 스크립트 즉시 실행
curl * | bash, wget * -O- | sh
```

### ⭕ Terminal Allow List (자동 승인 명령어)
*Strict 모드에서는 자동 승인을 허용하지 않으므로 비워둡니다.*
```bash
# (Empty)
```

### 📂 File Access Control
- **Deny**: `.env`, `*.pem`, `secrets/`, `.git/`, `.obsidian/`
- **Allow**: `.agent/workflows/`, `src/`, `docs/`

---

## 2. Level 2: Balanced (권장 설정)

**"위험한 행동은 막되, 안전한 조회 및 테스트 명령어는 자동화하여 생산성을 높입니다."**

### ✅ Key Settings
| 설정 항목 (Settings)                | 값 (Value)                                    |
| :---------------------------------- | :-------------------------------------------- |
| **Agent Gitignore Access**          | `OFF`                                         |
| **Enable Agent Web Tools**          | `ON`                                          |
| **Browser JS Execution Policy**     | `Request Review`                              |
| **Terminal Command Auto Execution** | `Request Review` (단, Allow List는 허용 고려) |

### 🚫 Terminal Deny List (접근 차단 명령어)
```bash
# 삭제 및 초기화 (매우 위험)
rm -rf, git clean -fd, docker-compose down -v, docker system prune
# 시스템 권한 및 소유권
sudo, chmod, chown, visudo
# 원격 저장소 강제 조작
git push -f, git push --force, git reset --hard
# 인프라 변경 및 삭제
terraform destroy, aws s3 rm --recursive
# 프로세스 종료 및 시스템 제어
kill -9, shutdown, reboot
# 인터넷 스크립트 즉시 실행
curl * | bash, wget * -O- | sh
```

### ⭕ Terminal Allow List (자동 승인 명령어)
*안전한 조회, 상태 확인, 테스트 명령어는 리스트에 등록하여 생산성을 높입니다.*
```bash
# 파일 및 정보 조회
ls, pwd, find, du -sh, git status, git log, git diff
# 텍스트 검색 및 출력
grep, rg, cat, head, tail
# 테스트 및 자동화 (안전 확인됨)
make all, make test, make lint, make format, make coverage, python -m pytest, pytest, flake8, black .
# 환경 조회
pip list, npm list, docker ps
```

### � File Access Control
- **Deny**: `.env`, `.git/`, `node_modules/`, `.venv/`
- **Allow**: `${workspaceFolder}` (전체 허용), `.agent/workflows/`

---

## 3. Level 3: Efficiency (편의성 중심)

**"AI가 모든 문맥을 파악하고 자율적으로 해결합니다. 단, 파괴적인 명령어는 최소한으로 방어합니다."**

### ✅ Key Settings
| 설정 항목 (Settings)                | 값 (Value)       |
| :---------------------------------- | :--------------- |
| **Agent Gitignore Access**          | `ON`             |
| **Agent Auto-Fix Lints**            | `ON`             |
| **Auto-Continue**                   | `ON`             |
| **Terminal Command Auto Execution** | `Always Proceed` |

### 🚫 Terminal Deny List (필수 차단)
*Always Proceed 상태에서도 이 명령어들은 반드시 물어보거나 차단하도록 설정합니다.*
```bash
# 핵심 위험 명령어 최소화
rm -rf, git clean -fd, git push -f, git reset --hard, terraform destroy, shutdown, reboot
```

### ⭕ Terminal Allow List
*모든 명령어가 기본적으로 허용되므로 별도 Allow List가 필요 없으나, 명시적 승인을 위해 Balanced의 리스트를 유지해도 무방합니다.*
```bash
# (Optional - Balanced Allow List 참고)
```

### 📂 File Access Control
- **Deny**: `.git/` (최소한의 보호)
- **Allow**: `./` (모든 경로)

---

## ⚙️ 적용 팁 (Tips)

### 1. 복사-붙여넣기 활용
위의 `bash` 코드 블록에 있는 명령어 목록을 복사하여 Antigravity 설정 화면의 **"Add Item"** 버튼을 누르고 붙여넣으세요. 쉼표(`,`)로 구분된 명령어들을 한 번에 인식할 수도 있고, 하나씩 추가해야 할 수도 있습니다.

### 2. Allow List 동작 원리
Allow List는 명령어가 해당 토큰으로 **시작(Prefix)**할 때 매칭됩니다.
- 예: `git status`를 등록하면 `git status --short`도 자동으로 허용됩니다.
- 주의: 단순히 `git`만 등록하면 `git push -f` 같은 위험한 명령어도 허용될 수 있으므로, `git status`, `git log`처럼 구체적으로 등록하는 것이 안전합니다.
