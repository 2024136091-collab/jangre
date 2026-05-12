# 모르는 영역 질문 목록 — 11주차 (2026-05-12)

> AI Agent가 만든 산출물 기준으로 추출한 학습 필요 영역.
> 각 항목은 발표·Q&A에서 질문받을 수 있는 내용입니다.

---

## 1. Flutter / Dart 기초

- [ ] `StatelessWidget`과 `StatefulWidget`의 차이는?
- [ ] `BuildContext`란 무엇이고 왜 필요한가?
- [ ] `pubspec.yaml`에서 패키지를 추가하는 방법은?
- [ ] `flutter run` / `flutter build apk` 명령의 차이는?

---

## 2. Riverpod 상태 관리

- [ ] Provider와 Riverpod의 핵심 차이는?
- [ ] `StateNotifier`란 무엇이고 언제 쓰는가?
- [ ] `ProviderScope`를 앱 최상단에 감싸는 이유는?
- [ ] `ref.watch`와 `ref.read`의 차이는?

---

## 3. Hive 데이터 저장

- [ ] Hive Box란 무엇인가?
- [ ] `TypeAdapter`가 필요한 이유는? (`build_runner`로 어떻게 생성하는가?)
- [ ] 저장 슬롯 3개를 Box로 어떻게 구현하는가?
- [ ] Hive vs SharedPreferences — 언제 어느 것을 쓰는가?

---

## 4. 아키텍처 (4레이어)

- [ ] Presentation·State·Domain·Data 레이어를 나누는 이유는?
- [ ] Domain Layer에 Flutter 의존성이 없어야 하는 이유는?
- [ ] `StoryEngine`이 `StoryNode`를 탐색하는 방식은?
- [ ] `CombatService` 데미지 공식에서 STR·DEF·AGI가 어떻게 계산되는가?

---

## 5. GoRouter (라우팅)

- [ ] GoRouter를 쓰는 이유는? (`Navigator.push`와 차이는?)
- [ ] 화면 간 데이터를 GoRouter로 어떻게 전달하는가?

---

## 6. 게임 시스템 설계

- [ ] `StoryNode`의 조건부 선택지는 코드로 어떻게 표현하는가?
- [ ] 상태이상(독·스턴·화상)을 턴마다 처리하는 로직 구조는?
- [ ] 엔딩 5종의 분기 조건을 어떻게 데이터로 표현하는가?
- [ ] 레벨업 XP 임계값 공식은? (예: `LV^2 × 100`)

---

## 7. 빌드 & 배포

- [ ] `flutter build apk --release`와 `--debug`의 차이는?
- [ ] APK를 GitHub Releases에 첨부하는 방법은?
- [ ] Android 에뮬레이터 설정 방법은?

---

## 학습 우선순위

| 우선순위 | 영역 | 이유 |
|---|---|---|
| 🔴 높음 | Riverpod 기초 | 모든 화면이 의존 |
| 🔴 높음 | Flutter 위젯 기초 | UI 구현 전제 조건 |
| 🟡 중간 | Hive TypeAdapter | 저장 기능 구현 시 필요 |
| 🟡 중간 | StoryNode 조건 설계 | 스토리 분기 핵심 |
| 🟢 낮음 | GoRouter | 기본 라우팅 먼저 구현 후 전환 가능 |
| 🟢 낮음 | 빌드·배포 | 14주차 전까지 여유 있음 |
