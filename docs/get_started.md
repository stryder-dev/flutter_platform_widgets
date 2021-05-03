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

> NOTE: Adding `localizationsDelegates` is important for `Cupertino` since some widgets expect localization to bet set up.

## Hybrid appliction

If you need to use `Material` widgets within your `Cupertino` such as `ListTile` you need to have the follwoing setting.

... TODO

## Theming

... TODO