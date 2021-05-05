# App Setup

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


---

### Next: 

[Theming](./theming.md)