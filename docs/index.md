# Overview

Flutter comes with a set of both [`Material`](https://flutter.dev/docs/development/ui/widgets/material) and [`Cupertino`](https://flutter.dev/docs/development/ui/widgets/cupertino) widgets for building rich user interfaces.

However, if you want to build an Android and iOS app with their corresponding widgets you typically will need to add conditional code throughout your code base to render the correct widget.

```dart
Widget build(BuildContext context) {
  final themeData = Theme.of(context);
  if (themeData.platform == TargetPlatform.iOS ||
      themeData.platform == TargetPlatform.macOS) {
    return ElevatedButton(
      onPressed: () => onAction(),
      child: Text('ACTION'),
    );
  } else {
    return CupertinoButton.filled(
      onPressed: () => onAction(),
      child: Text('Action'),
    );
  }
}
```

With `flutter_platform_widgets` you do not need to use conditionals.

```dart
Widget build(BuildContext context) {
  return PlatformElevatedButton(
      onPressed: () => onAction(),
      child: **PlatformText**('Action'),
    );
}

```