# aipetto app

This application has been developed using Flutter:
```
Flutter 2.0.2 • channel stable • ssh://git@github.com/flutter/flutter.git
Framework • revision 8962f6dc68 (4 months ago) • 2021-03-11 13:22:20 -0800
Engine • revision 5d8bf811b3
Tools • Dart 2.12.1
```

### Release on Android
```
update pubspec.yaml:version incrementing version
update android/app/build.gradle in the paramenter: versionCode incrementing version
flutter clean
flutter build apk --release
flutter build appbundle --release
```

### Release on iOS
```
flutter clean
rm ios/Podfile.lock pubspec.lock
rm ios/Podfile.lock pubspec.lock
rm -rf ios/Pods ios/Runner.xcworkspace
flutter build io --no-codesign
flutter build ios --release
```