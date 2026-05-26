# 배포 가이드 — Jangre

## APK 빌드 (Android)

### 1. 빌드 전 확인

```bash
flutter doctor          # 모든 항목 ✅ 확인
flutter pub get         # 의존성 최신화
```

### 2. 디버그 빌드 (개발·테스트용)

```bash
flutter build apk --debug
```

출력: `build/app/outputs/flutter-apk/app-debug.apk`

### 3. 릴리즈 빌드 (배포·발표용)

```bash
flutter build apk --release
```

출력: `build/app/outputs/flutter-apk/app-release.apk`

> 릴리즈 빌드는 서명 키가 없으면 디버그 키로 자동 서명됩니다.  
> 발표·시연용으로는 디버그 키 서명으로 충분합니다.

### 4. 에뮬레이터에 직접 설치

```bash
# 연결된 기기/에뮬레이터 목록
flutter devices

# 특정 기기에 설치 및 실행
flutter run -d emulator-5554

# APK 파일로 설치 (adb)
adb install build/app/outputs/flutter-apk/app-debug.apk
```

### 5. GitHub Releases 배포 (선택)

```bash
# gh CLI 사용
gh release create v0.1.0 \
  build/app/outputs/flutter-apk/app-release.apk \
  --title "v0.1.0 — 중간 발표 버전" \
  --notes "Must 기능 100% 구현. 엔딩 3종."
```

## 배포 체크리스트

- [ ] `flutter doctor` 이상 없음
- [ ] `flutter pub get` 완료
- [ ] 에뮬레이터에서 정상 실행 확인
- [ ] APK 빌드 성공
- [ ] 데모 시나리오 3개 사전 리허설
- [ ] 30초 데모 영상(mp4) 백업 녹화

## 트러블슈팅

| 문제 | 해결 |
|---|---|
| `flutter build apk` 실패 | `cd android && ./gradlew clean` 후 재시도 |
| Gradle 버전 오류 | `android/gradle/wrapper/gradle-wrapper.properties` 버전 확인 |
| 에뮬레이터 실행 안 됨 | Android Studio → Device Manager → 에뮬레이터 재시작 |
| APK 설치 후 즉시 종료 | `flutter run --debug` 로 로그 확인 |
