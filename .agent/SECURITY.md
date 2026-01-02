# Antigravity Security Guide

이 문서는 Antigravity Agent의 보안 설정(Settings > Agent)을 관리하기 위한 가이드입니다.
사용 목적과 보안 민감도에 따라 **3가지 프로필(Balanced, Strict, Efficiency)** 중 하나를 선택하여 설정을 적용하세요.

---

## 1. 설정 항목 설명 (Settings Reference)

설정 화면에 있는 각 항목의 의미입니다.

### **SECURITY**
- **Secure Mode**: 에이전트의 자율성을 제한하고 사람의 검토를 강제하는 가장 강력한 보안 스위치입니다. 켜져 있으면 많은 자동화 기능이 제한됩니다.

### **ARTIFACT**
- **Review Policy**: 에이전트가 생성한 문서(Artifact)를 편집할 때 사용자의 승인을 받을지 결정합니다.
    - *Always Proceed*: 묻지 않고 진행 (위험 높음)
    - *Agent Decides*: 에이전트가 판단 (권장)
    - *Request Review*: 항상 승인 필요

### **TERMINAL**
- **Command Auto Execution**: 터미널 명령어를 자동으로 실행할지 묻습니다.
    - *Always Proceed*: Allow List에 없어도 자동 실행 (속도 빠름, 위험)
    - *Request Review*: Allow List에 없는 경우 승인 요청 (안전)
- **Allow/Deny List**: 자동 실행을 허용하거나(Allow) 절대 실행하지 않을(Deny) 명령어를 정의합니다.

### **FILE ACCESS**
- **Gitignore Access**: `.gitignore`에 등록된 파일(비밀번호, 키 등)을 에이전트가 볼 수 있게 허용합니다.
- **Non-Workspace Access**: 현재 열려있는 워크스페이스 외부의 파일에 접근을 허용합니다.

### **AUTOMATION & GENERAL**
- **Auto-Fix Lints**: 에이전트가 코드 수정 후 린트 에러를 발견하면 자동으로 수정합니다.
- **Auto-Continue**: 답변이 길어질 경우 끊기지 않고 계속 이어서 작성합니다.
- **Web/Browser Tools**: 웹 검색 및 브라우저 제어(JS 실행 포함) 권한입니다.

---

## 2. 보안 프로필 (Security Profiles)

### 🛡️ Profile 1: Strict (철통 보안)
**추천 대상**: 금융 데이터, 개인정보, 프로덕션 DB 접근이 가능한 환경. **안전이 최우선**입니다.

| Category        | Setting                | Value                              |
| :-------------- | :--------------------- | :--------------------------------- |
| **Security**    | Secure Mode            | **ON**                             |
| **Artifact**    | Review Policy          | **Request Review**                 |
| **Terminal**    | Command Auto Execution | **Request Review**                 |
| **File Access** | Gitignore Access       | **OFF**                            |
|                 | Non-Workspace Access   | **OFF**                            |
| **Browser**     | Javascript Execution   | **Disabled** or **Request Review** |

### ⚖️ Profile 2: Balanced (표준 권장)
**추천 대상**: 일반적인 개발/학습 환경. 생산성과 안전의 균형을 맞춥니다.

| Category        | Setting                | Value                                      |
| :-------------- | :--------------------- | :----------------------------------------- |
| **Security**    | Secure Mode            | **OFF**                                    |
| **Artifact**    | Review Policy          | **Agent Decides**                          |
| **Terminal**    | Command Auto Execution | **Request Review** (단, Allow List는 자동) |
| **File Access** | Gitignore Access       | **OFF** (필요시 일시적 ON)                 |
| **Browser**     | Javascript Execution   | **Request Review**                         |

### ⚡ Profile 3: Efficiency (속도 중심)
**추천 대상**: 샌드박스 환경, 토이 프로젝트, 빠른 프로토타이핑. **위험을 감수하고 속도**를 높입니다.

| Category        | Setting                | Value                                 |
| :-------------- | :--------------------- | :------------------------------------ |
| **Security**    | Secure Mode            | **OFF**                               |
| **Artifact**    | Review Policy          | **Always Proceed** (or Agent Decides) |
| **Terminal**    | Command Auto Execution | **Always Proceed**                    |
| **File Access** | Gitignore Access       | **ON** (편의성)                       |
| **Browser**     | Javascript Execution   | **Always Proceed**                    |

---

## 3. 권장 터미널 목록 (Allow/Deny List)

`dev_feature_planner`를 Flask 프로젝트와 함께 사용할 때, TDD 사이클(Red-Green-Refactor) 자동화를 위해 아래 목록을 적용하세요.

### ✅ Flask Project Optimized Allow List
**목표**: `make` 명령어를 통해 테스트, 린트, 포맷팅을 에이전트가 스스로 수행하여 TDD 속도를 극대화합니다.

```text
# 1. 파일 시스템 기본 탐색 (거의 100% 자동 실행 OK)
ls
pwd
find
du
tree

# 2. Git 읽기 전용 상태 확인 (변경 없음 → 매우 안전)
git status
git log
git diff
git branch
git show

# 3. 텍스트 검색 & 읽기 (필수 + 안전)
cat
head
tail
grep
rg
sort
uniq
wc

# 4. Python 기본 + 확인 명령어
python
python3
pip list
pip freeze
pip show

# 5. 테스트 & 린트 & 포맷 (TDD 핵심, 가장 많이 쓰임)
pytest
make test
make lint
make format
make coverage
black
isort
flake8
ruff

# 6. Flask 기본 확인용 (run/migrate는 옵션 붙으면 거의 물어봄)
flask routes
```

### 🚫 Deny List (위험한 파괴/변경 명령어)
복사하여 `Settings > Deny List > Add`에 붙여넣으세요. 실수로라도 실행되지 않도록 막습니다.

```text
# 삭제 및 초기화 (매우 위험)
rm
rm -r
rm -rf
git clean
git clean -fd
docker system prune
docker-compose down
docker compose down

# 시스템 권한 & 소유권
sudo
chmod
chown
visudo

# 원격 저장소 강제 조작 (실수 1위)
git push -f
git push --force
git reset --hard
git commit -a -m     # ← 자동 add+commit 실수 방지

# 인프라/클라우드 파괴
terraform destroy
aws s3 rm

# 프로세스/시스템 강제 종료
kill -9
shutdown
reboot

# 인터넷 즉시 실행 (최악의 보안 구멍)
curl | bash
wget | bash
curl * | bash
wget * -O- | sh

# 추가 고위험 패턴 (실제 사용자들이 자주 후회)
find -delete
mv * ~               # 홈으로 대량 이동 실수
pip install --upgrade pip   # pip 자체 깨짐
```

---

## 4. 참고: 실용적 등록 팁 (Usability Tip)

Antigravity 설정 UI에 많은 명령어를 일일이 등록하기 번거로운 경우, **Prefix(접두어) 매칭**을 활용할 수 있습니다.

> **💡 Community Consensus (Practical Approach)**
> *   Allow List는 **핵심 접두어(Prefix)** 위주로 10~15개만 등록합니다.
> *   대신 **Deny List**를 꼼꼼하게 설정하여 안전망을 확보합니다.
> *   `Terminal Command Auto Execution`은 가능한 `Request Review`를 유지하여 모르는 명령어는 확인받도록 합니다.

### ✅ Essential Allow List (Prefix 기반 추천)
다음 15개 항목만 등록하면 대부분의 Python/Flask 개발 명령어가 커버됩니다.

```text
ls
pwd
find
du
tree
cat
grep
git
python
python3
pip
pytest
make
flask
black
isort
ruff
```

### 🚫 Core Deny List (필수 차단)
Prefix 방식을 쓸 때는 "의도치 않은 위험 명령어"도 허용될 수 있으므로(예: `git clean`), 아래 Deny List를 반드시 함께 등록해야 합니다.

```text
rm
git clean
git push -f
git push --force
git reset --hard
docker system prune
docker-compose down
docker compose down
sudo
chmod
chown
kill -9
shutdown
reboot
terraform destroy
aws s3 rm
curl | bash
wget | bash
```
