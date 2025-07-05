# Migration Notes

## Downgrade to Flutter 3.0.0

- **Steps**:
    - Get the flutter path with this command: ` flutter doctor --verbose `
    - Navigated to Flutter SDK directory: `cd /opt/homebrew/Caskroom/flutter/3.32.5/flutter`
    - Checked out version 3.0.0: `git checkout 3.0.0`
    - Ran `flutter clean` and `flutter pub get` in project directory


- **Issues**:
- ` The current Dart SDK version is 2.17.0. Because simple_post_app requires SDK version ^3.8.1, version solving failed.
  Running "flutter pub get" in simple_post_app...                         
  pub get failed (1; Because simple_post_app requires SDK version ^3.8.1, version solving failed.) `


