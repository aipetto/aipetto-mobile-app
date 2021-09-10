`# Aipetto pet owners app

The packages we use:

| Package                                                                              | Pub                                                                                                      |
| ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| State Management
| ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| [bloc](https://github.com/felangel/bloc/tree/master/packages/bloc)                   | [![pub package](https://img.shields.io/pub/v/bloc.svg)](https://pub.dev/packages/bloc)                   |
| [bloc_test](https://github.com/felangel/bloc/tree/master/packages/bloc_test)         | [![pub package](https://img.shields.io/pub/v/bloc_test.svg)](https://pub.dev/packages/bloc_test)         |

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
