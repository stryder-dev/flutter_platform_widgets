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

-----

## Contents


* [Get Started](./get_started.md)
* [App Setup](./app_setup.md)
* [Theming](./theming.md)
  
  
-----


## What this package is and is not

Each platform widget tries to remain as a simple wrapper to both a comparative `Material` and `Cupertino` widget. Each platform widget attempts to map common properties between the two platforms within the primary constructor arguments, but where they diverge provide platform specific data via the `material` and `cupertino` 'enhancing' properties.

What this package will not do is be too opinionated (or none at all) as to the implementation of a platform widget. Other than `PlatformScaffold` and `PlatformTabScaffold` each widget will directly map its property to its underlying platform widget. They will not be composed of numerous widgets which risks imposing a structure and style that does not cover typical use of a flutter widget.