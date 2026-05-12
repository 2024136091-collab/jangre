# AUTHORING.JAEHO.v0.2.0

> 이 파일 하나를 AI Agent에게 주면 프로젝트 전체 구조를 자동으로 부트스트랩합니다.

## 작성자 정보

- 이름: Jaeho
- 도구: Antigravity (AI Agent), Claude Code
- 학교: 신구대학교 컴퓨터소프트웨어학과
- 과목: 앱프로그래밍응용 (바이브 코딩 프로젝트)
- 팀: 1인 팀

---

## 프로젝트 개요

- 리포지토리: `jangre`
- **확정 주제: 텍스트 RPG (Text RPG)**
- 플랫폼: Flutter (모바일 — Android/iOS)
- 난이도 방향: 복잡한 게임 시스템 (스탯·전투·인벤토리·다중 엔딩)
- 기간: 2026년 9주차 ~ 15주차 (7세션)

### 핵심 시스템

| 시스템 | 내용 |
|---|---|
| 캐릭터 스탯 | HP·MP·STR·DEF·AGI·LV·XP |
| 인벤토리 | 아이템 획득·사용·버리기, 장비 슬롯(무기·방어구) |
| 전투 | 턴제, 데미지 공식, 상태이상(독·스턴·화상) |
| 스토리 | 다중 분기, 조건부 선택지(스탯·아이템·플래그), 엔딩 5종+ |
| 저장 | 슬롯 3개, Hive 기반 오프라인 저장 |

---

## 부트스트랩 지침

AI Agent는 이 파일을 읽은 후 아래 순서로 프로젝트 구조를 생성합니다.

### 1단계 — 기획 문서 생성

```
.planning/00-vision.md       # 프로젝트 비전과 목표
.planning/01-requirements.md # 기능 목록 (MoSCoW 분류)
```

### 2단계 — 일정 문서 생성

```
.planning/02-wbs.md          # WBS (3단계 깊이)
.planning/04-schedule.md     # 6주 일정 (10주~15주차)
```

### 3단계 — 설계 문서 생성

```
.planning/03-architecture.md              # 시스템 아키텍처 (Mermaid 포함)
docs/architecture.md                      # 사람이 읽는 아키텍처 설명
.planning/decisions/ADR-0001-platform.md          # Flutter 선택 근거
.planning/decisions/ADR-0002-state-management.md  # Riverpod 선택 근거
.planning/decisions/ADR-0003-data-storage.md      # Hive 선택 근거
```

### 4단계 — 운영 문서 생성

```
docs/setup.md    # zero → run (5분 안에 따라할 수 있는 수준)
docs/deploy.md   # 빌드와 배포 전 단계
docs/testing.md  # 테스트 실행 명령과 작성 규약
```

### 5단계 — 에이전트 운영 문서 생성

```
AGENTS.md                                        # 에이전트 운영 헌법
SPECS.md                                         # 도메인 고유 규칙
.github/agents/code-reviewer.agent.md            # 코드 리뷰 서브에이전트
.github/agents/test-writer.agent.md              # 테스트 작성 서브에이전트
.github/prompts/spec.prompt.md                   # /spec 슬래시 명령
.github/prompts/plan.prompt.md                   # /plan 슬래시 명령
.github/prompts/implement.prompt.md              # /implement 슬래시 명령
.github/prompts/retro.prompt.md                  # /retro 슬래시 명령
```

### 6단계 — 발표 자료 생성

```
docs/presentation/interim.md   # 중간 발표 (Marp, 7분)
docs/presentation/final.md     # 최종 발표 (Marp, 12분)
```

### 7단계 — 가산점 문서 생성

```
BONUS.md   # 가산점 신청 항목 정리 (A/B/C/D)
README.md  # 프로젝트 설명, 빌드/실행 방법
```

---

## AI Agent 운영 원칙

1. 모든 문서는 AI Agent가 생성하되, **Jaeho가 직접 읽고 이해한 후 커밋**한다.
2. 이해되지 않는 부분은 AI에게 다시 물어서 본인의 언어로 정리한다.
3. 발표·Q&A에서 "AI가 그렇게 했어요"는 답이 되지 않는다.
4. 커밋 메시지에는 AI가 생성한 부분과 본인이 검토한 부분을 구분해 기록한다.

---

## 서브에이전트 카탈로그

| 에이전트 | 역할 | 호출 시점 |
|---|---|---|
| `code-reviewer` | PR 코드 품질 검토 | 기능 구현 완료 후 |
| `test-writer` | 테스트 케이스 자동 생성 | 구현 직후 |

---

## 슬래시 명령 정의

| 명령 | 역할 |
|---|---|
| `/spec` | 요구사항 정의 시작 |
| `/plan` | WBS·일정 생성 |
| `/implement` | 기능 구현 시작 |
| `/retro` | 세션 회고 작성 |

---

## 버전 이력

| 버전 | 날짜 | 변경 내용 |
|---|---|---|
| v0.1.0 | 2026-04-28 | 초안 작성 (9주차 오리엔테이션) |
| v0.2.0 | 2026-05-12 | 주제 확정 — 텍스트 RPG (Flutter), 복잡한 게임 시스템 방향 |
