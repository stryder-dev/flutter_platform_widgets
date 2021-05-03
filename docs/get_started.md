# Get Started

## Installation

Run the following

```
$ flutter pub add flutter_platform_widgets
```

And then in `pubspec.yaml` 

```yaml
dependencies:
  flutter_platform_widgets: {LATEST}
```

And for any file you use add this import

```dart
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
```


## App Setup

Setup of the application is completely optional. All the platform widgets work without this setup if you have a `MaterialApp` as your app bootstrap widget.

However, to be closer to the actual `iOS (cupertino)` platform styling and behavour it is adviseable to use `PlatformApp`. If you need to add further configuration or need to switch between Cupertino and Material styles you need to add `PlatformProvider`

```dart
PlatformProvider(
  builder: (context) => PlatformApp(
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    title: 'Flutter Platform Widgets',
    home: MyHomePage(),
  ),
)
```

or if you want to use the new Navigator 2.0 use `PlatformApp.router`

```dart
PlatformProvider(
  builder: (context) => PlatformApp.router(
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    title: 'Flutter Platform Widgets',
    routeInformationParser: ...
    routerDelegate: ...
  ),
) 
```

> NOTE: Adding `localizationsDelegates` is important for `Cupertino` since some widgets expect localization to be set up.

## Using Material with Cupertino widgets

If you need to use `Material` widgets within your `Cupertino` app such as `ListTile` you need to have the following setting.

```dart
PlatformProvider(
  settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
  builder: ...
)
```

Without this you will get an exception stating that there is no Material widget as a parent for some of your `Material` widgets.

## Theming

This package does not have any special theming approach but rather provides a way to theme your `Material` and `Cupertino` apps independently. There are two main approaches, using `MaterialBasedCupertinoThemeData` to create the `Cupertino` theme from the same configuration from your `Material` app, or create and manage the `CupertinoTheme` separately.

### Using MaterialBasedCupertinoThemeData

First create a `Material` theme and add a parent `Theme` setting the theme data. This is required since some widgets will use `Theme.of(context)` to style themselves.

Then set the same material theme on the `PlatformApp` material property. This is required for some widgets that are configured via the `MaterialApp`.

To complete the theming add `MaterialBasedCupertinoThemeData(materialTheme: materialTheme)` to the cupertino property of the `PlatformApp`. This is required since `Cupertino` widgets will look for their styling via the `CupertinoApp`.

```dart
final materialTheme = ThemeData(
  primarySwatch: Colors.green,
);

return Theme(
  data: materialTheme,
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      localizationsDelegates: ...,
      title: ...,
      home: ...,
      material: (_, __) => MaterialAppData(
        theme: materialTheme,
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme:
            MaterialBasedCupertinoThemeData(materialTheme: materialTheme),
      ),
    ),
  ),
);
```

### Using CupertinoTheme directly

If you need `Cupertino` to look a bit more different to its `Material` counterpart then creating a `CupertinoTheme` is preferrable.

```dart
final materialTheme = ThemeData(
  primarySwatch: Colors.green,
);
final cupertinoTheme = CupertinoThemeData(
  primaryColor: Colors.red,
);

return Theme(
  data: materialTheme,
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      localizationsDelegates: ...,
      title: ...,
      home: ...,
      material: (_, __) => MaterialAppData(
        theme: materialTheme,
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme: cupertinoTheme,
      ),
    ),
  ),
);
```

### Brightness

#### Material

Theming `Material` for light and dark themes requires a separate `ThemeData` instance with the brightness property set accordingly. Then set the `theme` and `darkTheme` on the `MaterialAppData` respectively.

```dart
final materialLightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
);
final materialDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.cyan,
);

return Theme(
  data: materialTheme,
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      localizationsDelegates: ...,
      title: ...,
      home: ...,
      material: (_, __) => MaterialAppData(
        theme: materialLightTheme,
        darkTheme: materialDarkTheme,
      ),
      cupertino: ...,
    ),
  ),
);

```

#### Cupertino

Unlike `Material` which defines a different `ThemeData` for light and dark brightness, `CupertinoThemeData` uses `CupertinoDynamicColor` to define them. Simply set each property of the `CupertinoThemeData` to an instance of `CupertinoDynamicColor`...

```dart
final cupertinoTheme = CupertinoThemeData(
  primaryColor: CupertinoDynamicColor.withBrightness(
    color: Colors.red,
    darkColor: Colors.blue,
  ),
);
```