# ADR-0001: 플랫폼 선택 — Flutter

**날짜**: 2026-04-28  
**상태**: 결정됨

## 컨텍스트

모바일 RPG 앱을 개발해야 하며, Android/iOS 양쪽을 지원해야 한다.
선택지: Flutter, React Native, Kotlin(Android 전용), Swift(iOS 전용)

## 결정

**Flutter (Dart)** 를 선택한다.

## 근거

| 기준 | Flutter | React Native | Kotlin |
|---|---|---|---|
| 크로스플랫폼 | ✅ 단일 코드베이스 | ✅ | ❌ Android만 |
| 성능 | ✅ 자체 렌더링 | ⚠️ Bridge 오버헤드 | ✅ |
| 학습 자료 | ✅ 풍부 | ✅ | ✅ |
| 과목 요구 | ✅ | ✅ | ⚠️ |

## 결과

- Dart 언어로 단일 코드베이스 유지
- Android 에뮬레이터로 데모 가능
- iOS는 Mac 없이 시뮬레이터 불가 → Android 우선
