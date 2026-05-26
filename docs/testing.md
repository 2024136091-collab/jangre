# 테스트 가이드 — Jangre

## 테스트 실행

```bash
flutter test
```

특정 파일만:

```bash
flutter test test/character_test.dart
```

커버리지 포함:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 테스트 구조

```
test/
├── character_test.dart    # 캐릭터 스탯 단위 테스트
├── battle_logic_test.dart # 전투 로직 단위 테스트
└── game_state_test.dart   # 게임 상태 단위 테스트
```

## 단위 테스트 목록

### character_test.dart

| 테스트 | 내용 |
|---|---|
| `takeDamage reduces hp` | 데미지 적용 후 HP 감소 확인 |
| `takeDamage minimum 1` | DEF가 높아도 최소 1 피해 |
| `heal does not exceed maxHp` | 회복이 maxHp 초과하지 않음 |
| `isAlive returns false when hp is 0` | HP 0 시 isAlive == false |

### battle_logic_test.dart

| 테스트 | 내용 |
|---|---|
| `goblin has correct stats` | 고블린 스탯 검증 |
| `enemy takes damage correctly` | 적 데미지 적용 확인 |
| `item potion heals hero` | 포션 사용 시 HP 회복 |
| `bomb deals fixed damage` | 폭탄 25 고정 피해 확인 |

### game_state_test.dart

| 테스트 | 내용 |
|---|---|
| `reset clears inventory` | reset() 후 인벤토리 비어있음 |
| `addItem stacks same item` | 같은 아이템 수량 누적 |
| `goToScene updates currentSceneId` | 장면 이동 상태 갱신 |

## 현재 테스트 파일 작성

> 세션 5 (14주차) 에서 단위 테스트 코드 작성 예정.  
> 현재는 수동 테스트로 아래 시나리오를 검증합니다.

## 수동 테스트 시나리오

### 시나리오 1 — 승리 루트

1. 앱 실행 → 새 게임 시작
2. "의뢰를 받아들인다" 선택
3. 고블린 전투 → 공격으로 처치
4. "신비한 동굴로 간다" → 폭탄 획득 확인
5. 성문 전투 → 폭탄 사용 처치
6. 용왕 전투 → 처치
7. **엔딩 [영웅의 귀환] 화면 출력 확인** ✅

### 시나리오 2 — 패배 루트

1. 앱 실행 → 새 게임 시작
2. "도망쳐 숨는다" 선택
3. **엔딩 [패배] 화면 출력 확인** ✅

### 시나리오 3 — 인벤토리

1. 고블린 처치 후 포션 획득 확인
2. 🎒 인벤토리 버튼 탭 → 포션 목록 표시 확인
3. 포션 사용 → HP 30 회복 확인
4. 폭탄은 전투 중에만 사용 가능 메시지 확인
