# ADR-0001 — 모바일 플랫폼: Flutter 선택

- **상태**: 확정 (2026-05-12)
- **결정자**: Jaeho

---

## 배경

텍스트 RPG 앱을 모바일로 개발해야 한다. Android/iOS 모두 지원하는 크로스플랫폼 프레임워크가 필요하다.

## 검토한 대안

| 옵션 | 장점 | 단점 |
|---|---|---|
| Flutter (Dart) | 단일 코드베이스, 빠른 렌더링, 풍부한 UI 위젯, Hot Reload | Dart 학습 필요 |
| React Native (JS/TS) | 익숙한 JS 생태계 | 브리지 성능 이슈, 네이티브 모듈 복잡 |
| Android Native (Kotlin) | 최적 성능 | iOS 미지원, 개발 속도 느림 |

## 결정

**Flutter**를 선택한다.

## 이유

1. 과목 수업에서 Flutter를 권장 스택으로 제시함.
2. 단일 코드베이스로 Android·iOS 모두 커버 가능.
3. Dart는 타입 안전성이 높아 도메인 모델(스탯·인벤토리) 표현에 적합.
4. Hot Reload로 UI 반복 개발 속도가 빠름.

## 결과

- `pubspec.yaml`에 flutter SDK 의존성 설정.
- 배포 타겟: Android APK (GitHub Releases).
- iOS 빌드는 macOS 환경 필요로 이번 범위에서 제외.
