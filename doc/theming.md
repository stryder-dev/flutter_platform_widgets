- [Cupertino theme](#cupertino-theme)
- [Dark mode: material](#dark-mode-material)
- [Dark mode: cupertino](#dark-mode-cupertino)
- [Change theme when platform changes](#change-theme-when-platform-changes)


There is no direct platform theme due to the vast differences in the way Material and Cupertino themes are created. However you can configure the app theme by adding a parent `Theme` and having a custom theme to suit your needs.


```dart
final currentTheme = ThemeData.light(); // Change theme for your needs
Theme(data: currentTheme, 
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      title: 'Flutter Platform Widgets',
      home: _YourHomePage_(),
    ),
  ),
)
```

### Cupertino theme <a name="cupertino_theme"></a>

The simpliest way to get a cupertino theme in your app is to copy the values from the material theme and apply it to the `PlatformApp`. 

```dart
final materialTheme = ThemeData.light(); 
final cupertinoTheme = MaterialBasedCupertinoThemeData(materialTheme: materialTheme);
Theme(data: materialTheme, 
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      title: 'Flutter Platform Widgets',
      home: _YourHomePage_(),
      material: (_, __) => MaterialAppData(
        theme: materialTheme,
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme: cupertinoTheme,
      ),
    ),
  ),
)
```

### Dark mode: material <a name="material_dark_mode"></a>
If you support dark mode, either via using the devices default system mode or having the user change the theme within your app you will need to ensure the theme data used is correct.

```dart
// Your default app's theme mode selection which can be changed.
const themeMode = ThemeMode.light;

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();

 // Get the system setting light/dark mode if using ThemeMode.system
final platformBrightness =
        SchedulerBinding.instance.window.platformBrightness;
final isDark = themeMode == ThemeMode.system
    ? platformBrightness == Brightness.dark
    : themeMode == ThemeMode.dark;

final currentTheme = isDark? darkTheme : lightTheme
Theme(data: currentTheme, 
  child: PlatformProvider(
    builder: (context) => PlatformApp(
      title: 'Flutter Platform Widgets',
      home: _YourHomePage_(),
      material: (context, _) => MaterialAppData(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
      ),
    ),
  ),
)
```

### Dark mode: cupertino <a name="cupertino_dark_mode"></a>

Using dark mode for cupertino is not as straight forward due to a number of issues raised with flutter. See [#71590](https://github.com/flutter/flutter/issues/71590), [#80860](https://github.com/flutter/flutter/issues/80860), [#48438](https://github.com/flutter/flutter/issues/48438), [#51899](https://github.com/flutter/flutter/issues/51899)

These can be mitigated by having the cupertino theme customised...

```dart
final darkTheme = ThemeData.dark();
const darkDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.dark);
final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
    materialTheme: darkTheme.copyWith(
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor:
            darkDefaultCupertinoTheme.barBackgroundColor,
        textTheme: CupertinoTextThemeData(
          navActionTextStyle: darkDefaultCupertinoTheme
              .textTheme.navActionTextStyle
              .copyWith(color: darkTheme.primaryColor),
          navLargeTitleTextStyle: darkDefaultCupertinoTheme
              .textTheme.navLargeTitleTextStyle
              .copyWith(color: const Color(0xF0F9F9F9)),
        ),
      ),
    ),
  );
```

Then just set the cupertino theme on the `PlatformApp`. Ideally match the system chrome to match dark mode also.

```dart
if (isCupertino(context)) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

PlatformApp(
  title: 'Flutter Platform Widgets',
  home: _YourHomePage_(),
  cupertino: (_, __) => CupertinoAppData(
    theme: cupertinoTheme,
  ),
),
```

### Change theme when platform changes  <a name="change_theme"></a>

In cases where your app can switch between material and cupertino themes (much like the example from this project) you need to make sure the correct theme is kept the same. 

Somewhere in your app you can just change the target platform...

```dart
// Perhaps this in a button click handler
final provider = PlatformProvider.of(context)!;

isMaterial(context)
    ? provider.changeToCupertinoPlatform()
    : provider.changeToMaterialPlatform();
```

This will rebuild the app with the new target platform however you need to make sure the correct theme is applied. Coupled with light and dark theme the complete theme setup probably should be this...

```dart
// Your default app's theme mode selection which can be changed.
const themeMode = ThemeMode.light;

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();

 // Get the system setting light/dark mode if using ThemeMode.system
final platformBrightness =
        SchedulerBinding.instance.window.platformBrightness;
final isDark = themeMode == ThemeMode.system
    ? platformBrightness == Brightness.dark
    : themeMode == ThemeMode.dark;

final cupertinoLightTheme = MaterialBasedCupertinoThemeData(materialTheme: lightTheme);
const darkDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.dark);
final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
    materialTheme: darkTheme.copyWith(
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor:
            darkDefaultCupertinoTheme.barBackgroundColor,
        textTheme: CupertinoTextThemeData(
          navActionTextStyle: darkDefaultCupertinoTheme
              .textTheme.navActionTextStyle
              .copyWith(color: darkTheme.primaryColor),
          navLargeTitleTextStyle: darkDefaultCupertinoTheme
              .textTheme.navLargeTitleTextStyle
              .copyWith(color: const Color(0xF0F9F9F9)),
        ),
      ),
    ),
  );

final currentTheme = isDark? darkTheme : lightTheme
Theme(data: currentTheme, 
  child: PlatformProvider(
    builder: (context) {
      if (isCupertino(context)) {
        SystemChrome.setSystemUIOverlayStyle(
          isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        );
      }
      
      final localLightTheme =
        lightTheme.copyWith(platform: Theme.of(context).platform);

      final locaDarkTheme =
        darkTheme.copyWith(platform: Theme.of(context).platform);

      return PlatformApp(
        title: 'Flutter Platform Widgets',
        home: _YourHomePage_(),
        material: (context, _) => MaterialAppData(
          theme: localLightTheme,
          darkTheme: locaDarkTheme,
          themeMode: themeMode,
        ),
        cupertino: (context, _) => CupertinoAppData(
          theme: isDark? cupertinoDarkTheme : cupertinoLightTheme,
        ),
      );
    }
  ),
)
```