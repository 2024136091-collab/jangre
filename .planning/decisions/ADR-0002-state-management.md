# ADR-0002 — 상태 관리: Riverpod 선택

- **상태**: 확정 (2026-05-12)
- **결정자**: Jaeho

---

## 배경

텍스트 RPG는 캐릭터 스탯, 인벤토리, 현재 스토리 노드, 전투 상태 등 여러 상태가 화면 간에 공유된다. Flutter의 기본 `setState`만으로는 관리가 어렵다.

## 검토한 대안

| 옵션 | 장점 | 단점 |
|---|---|---|
| Riverpod 2.x | BuildContext 불필요, 테스트 용이, 타입 안전 | 초기 개념 학습 필요 |
| Provider | 공식 권장, 자료 풍부 | ProviderScope·context 의존, Riverpod보다 verbose |
| GetX | 코드 간결 | 과도한 마법, 테스트 어려움, 커뮤니티 비선호 |
| BLoC | 대규모 앱에 적합, 명확한 이벤트/상태 분리 | 보일러플레이트 과다 |

## 결정

**Riverpod 2.x**를 선택한다.

## 이유

1. `BuildContext` 없이 어디서든 Provider에 접근 가능 → 서비스 레이어 테스트 용이.
2. `StateNotifier` / `AsyncNotifier` 패턴으로 게임 상태 명확히 모델링 가능.
3. `flutter_riverpod` 최신 버전이 Flutter 3.x와 호환.
4. 학습 자료가 Provider보다 최신화되어 있음.

## 결과

- `pubspec.yaml`에 `flutter_riverpod: ^2.x` 추가.
- 각 도메인마다 별도 Notifier 분리: `CharacterNotifier`, `GameStateNotifier`, `CombatNotifier`.
- `ProviderScope`로 앱 전체 감싸기.
