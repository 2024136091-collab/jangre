# Setup Guide — 텍스트 RPG (jangre)

> 이 문서만 따라가면 5분 안에 에뮬레이터에서 앱을 실행할 수 있습니다.

---

## 1. 필요한 도구 버전

| 도구 | 최소 버전 | 설치 확인 명령 |
|---|---|---|
| Flutter SDK | 3.x | `flutter --version` |
| Dart | 3.x (Flutter 포함) | `dart --version` |
| JDK | 17 | `java -version` |
| Android Studio | Hedgehog 이상 | AVD Manager 실행 확인 |
| VS Code (선택) | 최신 | Flutter + Dart 플러그인 설치 |
| Git | 2.x | `git --version` |

> **확인 한 번에**: `flutter doctor` 실행 후 모든 항목이 ✓ 이어야 합니다.

---

## 2. 클론 명령

```bash
git clone https://github.com/jaeho/jangre.git
cd jangre
```

> 리포지토리 URL은 GitHub 페이지에서 확인하세요.

---

## 3. 의존성 설치 명령

```bash
# Flutter 패키지 설치
flutter pub get

# Hive TypeAdapter 코드 생성 (저장 기능 구현 후 필요)
dart run build_runner build --delete-conflicting-outputs
```

> `flutter pub get` 은 `pubspec.yaml` 의 모든 패키지를 한 번에 내려받습니다.

---

## 4. 환경 변수 설정

현재 버전(오프라인 단일 챕터)은 환경 변수가 필요하지 않습니다.

향후 Claude API 연동 시:

```bash
# .env.example 복사 후 키 입력
cp .env.example .env
```

`.env.example` 내용:

```
# Claude API (미래 버전 — AI 스토리 생성 기능)
ANTHROPIC_API_KEY=sk-ant-여기에_키_입력
```

> `.env` 파일은 `.gitignore` 에 포함되어 있으므로 커밋되지 않습니다.

---

## 5. 첫 실행 명령

```bash
# 연결된 에뮬레이터 또는 기기 확인
flutter devices

# 앱 실행 (debug 모드)
flutter run

# 특정 기기 지정 실행
flutter run -d emulator-5554

# Release APK 빌드
flutter build apk --release
```

> 에뮬레이터가 없으면 Android Studio → Device Manager → Create Device 에서 생성하세요.

---

## 6. 문제 해결 (FAQ)

### Q1. `flutter doctor` 에서 Android toolchain 항목이 ✗ 입니다.

Android Studio를 열고 **SDK Manager → SDK Tools** 탭에서
`Android SDK Build-Tools`, `Android SDK Platform-Tools` 가 설치되어 있는지 확인하세요.
그 다음 아래 명령으로 라이선스에 동의합니다.

```bash
flutter doctor --android-licenses
```

---

### Q2. `flutter pub get` 실행 시 패키지 버전 충돌 오류가 납니다.

`pubspec.yaml` 의 패키지 버전을 확인하세요.
Hive · Riverpod · GoRouter 는 서로 호환되는 버전을 명시해야 합니다.

```bash
# 의존성 트리 확인
flutter pub deps
```

충돌 시 `pubspec.yaml` 의 버전 제약을 완화하거나 `flutter pub upgrade` 를 실행하세요.

---

### Q3. `dart run build_runner build` 에서 오류가 납니다.

기존 생성 파일이 충돌하는 경우입니다.

```bash
dart run build_runner build --delete-conflicting-outputs
```

그래도 안 되면 `*.g.dart` 파일을 직접 삭제 후 재실행하세요.

---

### Q4. 에뮬레이터에서 앱이 바로 종료됩니다.

**Hive 초기화** 코드가 `main()` 에 있는지 확인하세요.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Adapter 등록 코드
  runApp(const ProviderScope(child: MyApp()));
}
```

---

### Q5. `flutter run` 후 화면이 빈 흰 화면으로 나옵니다.

`GoRouter` 의 초기 경로(`initialLocation`)가 잘못 설정된 경우입니다.
`app/router.dart` 에서 `initialLocation: '/'` 가 `HomeScreen` 을 가리키는지 확인하세요.

```bash
# 에러 로그 확인
flutter run --verbose
```
