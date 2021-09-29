`# Aipetto pet owners app

The packages we use:

| Package                                                                              | Pub                                                                                             |
| ---------------------------------------------------- | ------------------------------------------------------------------|
| State Management
| ---------------------------------------------------- | ------------------------------------------------------------------|
| [bloc](https://github.com/felangel/bloc/tree/master/packages/bloc)                   | [![pub package](https://img.shields.io/pub/v/bloc.svg)](https://pub.dev/packages/bloc)          |
| [bloc_test](https://github.com/felangel/bloc/tree/master/packages/bloc_test)         | [![pub package](https://img.shields.io/pub/v/bloc_test.svg)](https://pub.dev/packages/bloc_test)|

## Project Structure

The project is organized following a domain-driven or feature(module reservations, module user, module business)
approach instead of layered(one folder for pages, other for repositories, other for widgets, etc).

```
├── lib
|   ├  │──components
|   ├  │──config
|   ├  │──data
|   ├  │──config.storage
|   ├  │──routes
|   ├  │──utils
│   │  │──modules
│   │        ├── module-feature (example: businessServiceReservation)
│   │           ├── bloc
│   │           │   └── module_bloc.dart
|   |           |   └── module_event.dart
|   |           |   └── module_state.dart
|   |           └── models
|   |           |   └── models.dart*
|   |           |   └── post.dart
│   │           └── repository
│   │           └── service
│   │           └── view
│   │           |   ├── module_page.dart
│   │           |   └── module_list.dart
|   |           |   └── view.dart*
|   |           └── widgets
|   |           |   └── module_loader.dart
|   |           |   └── module_list_item.dart
|   |           |   └── widgets.dart*
│   │           ├── barel-file.dart*
│   ├── app.dart
│   ├── simple_bloc_observer.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```

## Development

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

### Setup basic development environment in iOS
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

For iOS do flutter build ios --release and then open/run the project in Xcode
```

#### Troubleshooting
How to Fix Release APK Is Not Working Properly?
Users can give a try to below code snippet.

```
flutter clean
```
and run the below command in the terminal.
```
flutter build apk --release
```
Open the file “android/app/src/main/AndroidManifest.xml” and add the proper user-permission:

```
<manifest>
 <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

Make  change in local.properties android project

```
sdk.dir=D:/SDK               //your android SDK location
flutter.sdk=D:\\Flutter\\flutter  //your flutter SDK location
flutter.versionName=1.0.0
flutter.versionCode=2
flutter.buildMode=release
Changes in your android/app/build.gradle file
buildTypes {
       release {
           // if everything ok then not add
           //minifyEnabled true
           //another you can remove minifyEnabled true
           proguardFiles getDefaultProguardFile('proguard-
            android.txt'), 'proguard-rules.pro'
           signingConfig signingConfigs.release
       }
   }
```
You can also change in android/app/build.gradle defaultConfig method body.
multiDexEnabled true
If you want to migrate to androidx then do it setup.
```
dependencies {
 Implementation 'junit:junit:4.12' androidTest
 Implementation 'androidx.test:runner:1.1.1' androidTest
 Implementation 'androidx.test.espresso:espresso-core:3.1.1'
 implementation 'androidx.multidex:multidex:2.0.1'
}
```
and clean before creating a build folder by following this cmd.
```
flutter clean
flutter build apk --release
flutter install
flutter build bundle --release
```
Go to Release Apk location
```
cd build\app\outputs\apk\release
```

#### Google SignIn Certificates SHA-1 between Google Release Play Console and Firebase Authentication Project
- In Google Play Console, visit Setup > App signing
- Copy SHA-1 certificate fingerprint
- Copy SHA-1 from Google Play App signing key certificate
- In your Firebase Console, visit Settings > Project settings
- Click Add fingerprint
- Add fingerprint in Firebase console
- Paste copied SHA-1 certificate fingerprint into Certificate fingerprint textfield
- Click Save
- Paste SHA-1 certificate & save
```
navigate to the android folder in you project
run this command ./gradlew signingReport
find release SHA certificate fingerprint
find debug SHA certificate fingerprint
add them to the firebase account SHA certificate fingerprints
redownload the google-services.json
```