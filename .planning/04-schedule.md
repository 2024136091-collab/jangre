# 04-schedule.md — 6주 일정 (10주차 ~ 15주차)

## 전체 마일스톤

| 주차 | 목표 | 핵심 산출물 | 검증 기준 |
|---|---|---|---|
| 10주차 | 기획·일정 수립 | `.planning/` 문서 5개 + `BONUS.md` | 본인 리뷰 후 커밋 |
| 11주차 | 설계·환경 구축 | 아키텍처 + ADR 3개 + Flutter Hello World | `flutter run` 성공 |
| 12주차 | 프로토타입 + **중간 발표** | StoryScreen·CombatScreen 동작 | 데모 시연 가능 |
| 13주차 | 핵심 기능 완성 | 인벤토리·장비·레벨업·저장 완성 | 엔딩 3종 도달 가능 |
| 14주차 | 마감·배포·문서화 | Release APK + docs 완성 | APK 설치·실행 확인 |
| 15주차 | **최종 발표 평가** | 발표 자료 + 데모 | 발표 + Q&A |

---

## 주차별 상세 일정

### 10주차 (2026-05-12) — 기획·일정

- [x] `.planning/00-vision.md` 작성
- [x] `.planning/01-requirements.md` 작성
- [x] `.planning/02-wbs.md` 작성
- [x] `.planning/04-schedule.md` 작성
- [x] `BONUS.md` 초안
- [ ] ADR-0001 초안 (플랫폼 결정)
- [ ] 리포지토리 커밋·푸시

### 11주차 (2026-05-19) — 설계·환경

- [ ] `.planning/03-architecture.md` 완성
- [ ] ADR-0002 (상태 관리), ADR-0003 (데이터 저장) 작성
- [ ] Flutter 프로젝트 초기화 (`flutter create`)
- [ ] 폴더 구조 (`lib/domain/`, `lib/data/`, `lib/presentation/`) 생성
- [ ] Hello World 에뮬레이터 실행 확인
- [ ] 리포지토리 커밋·푸시

### 12주차 (2026-05-26) — 프로토타입 + 중간 발표

- [ ] `Character`, `StoryNode`, `GameState` 모델 구현
- [ ] `StoryEngine` 기본 구현 (노드 탐색·분기)
- [ ] `StoryScreen` UI 구현 (텍스트·선택지)
- [ ] `CombatService` 기본 구현 (공격·HP 계산)
- [ ] `CombatScreen` UI 구현 (턴 로그·버튼)
- [ ] 중간 발표 슬라이드 (`interim.md`) 작성
- [ ] **중간 발표 시연**

### 13주차 (2026-06-02) — 핵심 기능 완성

- [ ] 인벤토리·장비 시스템 구현 (`Item`, `Equipment` 모델 + UI)
- [ ] 상태이상 시스템 구현 (독·스턴·화상)
- [ ] 레벨업·스탯 분배 구현
- [ ] Hive 저장/불러오기 구현 (슬롯 3개)
- [ ] 스토리 노드 데이터 완성 (챕터 1 전체)
- [ ] 엔딩 5종 조건 구현
- [ ] 단위 테스트 작성 (`CombatService`, `StoryEngine`)

### 14주차 (2026-06-09) — 마감·배포·문서

- [ ] `docs/setup.md` 완성
- [ ] `docs/deploy.md` 완성 (APK 빌드 절차)
- [ ] `docs/testing.md` 완성
- [ ] `AGENTS.md` 작성
- [ ] `README.md` 완성
- [ ] Release APK 빌드·GitHub Releases 업로드
- [ ] 최종 발표 슬라이드 (`final.md`) 작성

### 15주차 (2026-06-16) — 최종 발표

- [ ] 발표 리허설
- [ ] **최종 발표 + Q&A**
- [ ] 프로젝트 회고 작성

---

## 위험 식별 및 대응

| # | 카테고리 | 위험 | 대응 방안 |
|---|---|---|---|
| R01 | 기술 | Flutter·Dart 학습 곡선 | 11주차에 Hello World + 기본 위젯 연습 선 진행 |
| R02 | 기술 | Riverpod 개념 이해 | 단순 `StateNotifier`부터 시작, 점진적 적용 |
| R03 | 일정 | 시험·과제 폭주 (13~14주차) | WBS 항목을 작게 쪼개 하루 1~2시간 분량 유지 |
| R04 | 기술 | Hive 타입 어댑터 생성 오류 | `build_runner` 사전 학습, 오류 시 직렬화 수동 구현 대체 |
| R05 | AI 의존 | AI 생성 코드 이해 부족 | 커밋 전 반드시 본인이 코드 읽고 주석 달기 |
| R06 | 외부 의존 | pub.dev 패키지 버전 충돌 (Hive·Riverpod·GoRouter) | `pubspec.yaml` 버전 고정, 충돌 시 대체 패키지 검토 |
