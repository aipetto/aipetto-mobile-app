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

### Install and Release on iOS
```
- [x] Fetch aipetto mobile app and build project
- [x] Install Flutter SDK
    - [x] Extract .zip and create folder dev on Users home
    - [x] set Flutter SDK downloading .zip from Flutter documentation
                check echo $SHELL
                export PATH="$PATH:/Users/aipetto/dev/flutter/bin"
    - [x] Generate Flutter Project: ml_breed_face_recognition
    - [x]  Xcode License
    - [x] Edit PATH Variable .zshrc echo $SHELL
- [x] Install home-brew and command line tools
- [x] Install Xcode command-line tool
- [x] Install CocoaPods
- [x] Install iOS Emulator
- [x] Install Git and SSH 

```
