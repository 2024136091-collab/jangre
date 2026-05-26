# ADR-0003: 로컬 저장소 — Hive

**날짜**: 2026-05-12  
**상태**: 결정됨 (Should 단계에서 구현)

## 컨텍스트

게임 저장/불러오기 기능이 필요하다.  
선택지: SharedPreferences, Hive, SQLite, Isar

## 결정

**Hive** 를 선택한다.

## 근거

| 기준 | Hive | SharedPreferences | SQLite |
|---|---|---|---|
| 타입 안전성 | ✅ TypeAdapter | ❌ 문자열만 | ⚠️ |
| 속도 | ✅ 순수 Dart | ⚠️ | ⚠️ |
| 복잡 구조 저장 | ✅ | ❌ | ✅ |
| Flutter 연동 | ✅ | ✅ | ⚠️ |

## 결과

- Must 단계: 인메모리 (저장 없음)
- Should 단계: Hive로 세이브/로드 구현
- `hive`, `hive_flutter` 패키지 사용
