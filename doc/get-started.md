
To make the most out of a single `PlatformWidget` it is best to replace the `MaterialApp` with the `PlatformApp` and to add the `PlatformProvider` widget above it. Although strictly both are not required, some platform specific widgets may expect them to be present.

Replace the `MaterialApp` with the following...
```dart
PlatformProvider(
  builder: (context) => PlatformApp(
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    title: 'Flutter Platform Widgets',
    home: _YourHomePage_(),
  ),
)
```

Properties on `PlatformProvider` widget include...

| Property  | Description  |
|---|---|
| initialPlatform  | A platform override value from `TargetPlatform` or null to default to the device's platform  |
| settings  | An instance of type `PlatformSettingsData` which can control what platform gets what design language widgets  |
| builder (required) | The main builder function which typically has the `PlatformApp` as its child  |

Notable properties on the `PlatformApp` widget include...

| Property  | Description  |
|---|---|
| PlatformApp.router  | Named constructor which configures the underlying `MaterialAp.router` or `CupertinoApp.router` widgets  |

For a complete sample, see the [Getting started sample][] in the example directory.

[Getting started sample]: https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/main.dart