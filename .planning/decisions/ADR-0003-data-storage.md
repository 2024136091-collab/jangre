# ADR-0003 — 데이터 저장: Hive 선택

- **상태**: 확정 (2026-05-12)
- **결정자**: Jaeho

---

## 배경

게임 저장 슬롯(3개)에 캐릭터 스탯, 인벤토리, 스토리 진행 플래그를 저장하고 불러와야 한다. 오프라인 환경에서도 동작해야 하며, Flutter 위젯과 분리된 순수 Dart 레이어에서 접근 가능해야 한다.

## 검토한 대안

| 옵션 | 장점 | 단점 |
|---|---|---|
| Hive 2.x | 빠른 NoSQL, Flutter 친화적, 순수 Dart | TypeAdapter 코드 생성 필요 |
| SQLite (sqflite) | 관계형, SQL 쿼리 | 스키마 설계·마이그레이션 복잡 |
| SharedPreferences | 간단한 키-값 | 복잡한 객체 직렬화 불편 |
| Isar | 빠르고 현대적 | 학습 자료 적음, FFI 의존 |

## 결정

**Hive 2.x**를 선택한다.

## 이유

1. NoSQL 구조가 게임 저장 데이터(비정형, 중첩 구조)에 적합.
2. 인메모리 수준의 읽기 속도 — 저장·불러오기 지연 없음.
3. `TypeAdapter` 자동 생성(`build_runner`)으로 Dart 모델과 직결.
4. Flutter 공식 문서에서도 오프라인 저장에 자주 언급.

## 결과

- `pubspec.yaml`에 `hive: ^2.x`, `hive_flutter: ^1.x`, `hive_generator: ^2.x` 추가.
- `CharacterAdapter`, `GameStateAdapter`를 `build_runner`로 생성.
- 저장 슬롯은 Box 이름 `save_slot_0`, `save_slot_1`, `save_slot_2`로 분리.
