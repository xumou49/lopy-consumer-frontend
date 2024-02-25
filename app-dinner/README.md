# flutter_projects

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Command

### Retrofit Command

Used for the code generation of api request, the output file format is `xxxx_api_g.dart`.
Example of source api request refer to `lib/src/data/data_sources/remote/restaurants_api.dart`
- dart: `dart pub run build_runner build` 
- flutter: `flutter pub run build_runner build`

### AutoRoute Command

Used for the code generation of route component, the output file is `xxx_gr.dart`
- `flutter packages pub run build_runner build`
- `flutter packages pub run build_runner watch` (watch the editing of file system and do the hot reload)