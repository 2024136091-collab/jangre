---
marp: true
theme: default
paginate: true
backgroundColor: '#1a1a2e'
color: '#eaeaea'
style: |
  h1 { color: #e94560; }
  h2 { color: #0f3460; background: #e94560; padding: 4px 12px; border-radius: 4px; }
  table { font-size: 0.85em; }
  code { background: #0f3460; color: #eaeaea; }
---

# 텍스트 RPG
### jangre — 바이브 코딩 프로젝트

**신구대학교 컴퓨터소프트웨어학과**
앱프로그래밍응용 | 12주차 중간 발표

---

## 한 줄 소개

> 선택이 캐릭터를 성장시키고 세계를 바꾸는
> **모바일 텍스트 RPG**

- 플랫폼: Flutter (Android / iOS)
- 저장: Hive 오프라인 슬롯 3개
- 규모: 엔딩 5종 이상, Must 기능 11개

---

## 왜 어려운 주제를 골랐나

| 처음 후보 | 바꾼 이유 |
|---|---|
| 습관 트래커 | CRUD만 있어 도전이 없음 |
| 플래시카드 앱 | UI 중심, 게임 로직 없음 |
| **텍스트 RPG** ✅ | 전투·분기·저장·성장 — 모든 레이어 활용 |

---

## 핵심 시스템

| 시스템 | 구현 내용 |
|---|---|
| 캐릭터 스탯 | HP · MP · STR · DEF · AGI · LV · XP |
| 턴제 전투 | 공격·스킬·아이템·도망, 데미지 공식, 상태이상 3종 |
| 스토리 분기 | 스탯·아이템·플래그 조건부 선택지 |
| 인벤토리·장비 | 20슬롯, 무기·방어구 슬롯 |
| 다중 엔딩 | 5종 이상, 선택 이력과 스탯 반영 |

---

## 아키텍처 — 4레이어

```
Presentation  →  화면 7개 (Flutter 위젯)
Application   →  Riverpod Notifier 3개
Domain        →  CombatService · StoryEngine · ProgressionService
Data          →  SaveRepository (Hive) · StoryRepository
```

> 화면은 Notifier만 바라본다.
> Domain은 Flutter를 모른다 → 단위 테스트 가능.

---

## 기술 선택 근거 (ADR)

| 기술 | 선택 이유 |
|---|---|
| Flutter | 단일 코드베이스로 Android·iOS 동시 지원, Hot Reload |
| Riverpod | BuildContext 불필요, 여러 화면 상태 공유, 테스트 용이 |
| Hive | NoSQL로 중첩 게임 데이터 직렬화, 인메모리 수준 속도 |

---

## 현재까지 완료한 것 (세션4 기준)

- ✅ 비전 · 요구사항 · WBS · 일정 문서
- ✅ 4레이어 아키텍처 설계 + Mermaid 다이어그램
- ✅ ADR 3개 (Flutter · Riverpod · Hive)
- ✅ `docs/setup.md` · `docs/deploy.md` · `docs/testing.md`
- ✅ Flutter 앱 코드 구현 (Must 기능 100%)
  - M1 캐릭터 스탯 · M2 스토리 분기 · M3 턴제 전투
  - M4 인벤토리 · M5 다중 엔딩 3종
- ✅ 데모 시연 가능 상태

전체 진척: **Must 기능 100%** (목표 50% 초과 달성)

---

## 다음 주 (13주차) 목표

1. Hive 저장·불러오기 (Should S01)
2. 단위 테스트 작성
3. 전투 밸런스 튜닝
4. Should 기능 추가 시작

---

## Q&A

> "AI가 그렇게 했어요"는 답이 되지 않습니다.
> 모든 설계 결정에 이유를 말할 수 있습니다.

**감사합니다.**
