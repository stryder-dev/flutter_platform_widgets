# Utils

## icons_gen

### Description:

- Automatically generate platform icons extension class (library file) with the same name between Material and Cupertino to `lib/src/platform_icons_gen.dart` file with sorted by name by dart's `Extension`, without changing the existing code(`lib/src/platform_icons.dart`)

- Automatically generate example page of all icons to file `example/lib//icons_page.dart` with sorted by name, from file `lib/src/platform_icons.dart` and `lib/src/platform_icons_gen.dart`.

### Usage:

- Automatically detect (Based on `flutter doctor -v` command, may be slowly):

  ```
  python3 utils/icons_gen/main.py
  ```

- Manually:

  ```
  python3 utils/icons_gen/main.py --flutter-path <path-to-flutter-sdk>
  ```
