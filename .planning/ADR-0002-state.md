# ADR-0002: 상태 관리 — StatefulWidget → Riverpod

**날짜**: 2026-05-12  
**상태**: 결정됨

## 컨텍스트

게임 상태(스탯, 인벤토리, 현재 장면)를 여러 화면이 공유해야 한다.
선택지: setState, Provider, Riverpod, Bloc

## 결정

**1차(프로토타입): StatefulWidget + setState**  
**2차(정식): Riverpod**

## 근거

- 프로토타입 단계에서 Riverpod의 보일러플레이트는 오버엔지니어링
- StatefulWidget으로 빠르게 동작을 검증한 뒤 Riverpod으로 리팩터링
- Riverpod은 Provider보다 컴파일 타임 안전성이 높음

## 결과

- 세션 4까지: StatefulWidget + GameState 클래스 (싱글턴)
- 세션 5부터: Riverpod StateNotifier 도입 예정
