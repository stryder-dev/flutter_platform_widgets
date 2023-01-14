- [Plaform](#platform)
- [Platform Widget](#platform-widget)
- [Platform Widget builder](#platform-widget-builder)
- [Platform Icons](#platform-icons)
- [Platform Theme data](#platform-theme-data)

## Platform <a name="platform"></a>

You can get the `PlatformTarget` enum when using `platform` in order to know what platform is being targeted.

```dart
final platform = platform(context);
```

This differs to flutters `TargetPlatform` in that it includes `PlatformTarget.web` rather than needing to check for `kIsWeb`

## Platform Widget <a name="platform_widget"></a>

A widget that will render either the material widget or cupertino widget based on the target platform. The widgets themselves do not need to be specifically Material or Cupertino.

```dart
return PlatformWidget(
  material: (_, __)  => Icon(Icons.flag),
  cupertino: (_, __) => Icon(CupertinoIcons.flag),
);
```

## Platform Widget builder <a name="platform_widget_builder"></a>

Renders a parent widget for either `Cupertino` or `Material` while sharing a common child Widget

```dart
 PlatformWidgetBuilder(
   material: (_, child, __) => IniWell(child: child, onTap: _handleTap),
   cupertino: (_, child, __) => GestureDetector(child: child, onTap: _handleTap),
   child: Container(child: Text('Common text')),
 );
```

## Platform Icons <a name="platform_icons"></a>

Render a `Material` or `Cupertino` looking icon

```dart
  Icon(context.platformIcons.book)
//or
  Icon(PlatformIcons(context).book)
```

View the [source](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_icons.dart) or [screenshots](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/ICONS.md) for the list of icons.

## Platform Theme data <a name="platform_theme_data"></a>

Helper function to a `Material` or `Cupertino` theme data property based on the platform

```dart
Text(
  platform.text,
  textAlign: TextAlign.center,
  style: platformThemeData(
    context,
    material: (ThemeData data) => data.textTheme.headline5,
    cupertino: (CupertinoThemeData data) => data.textTheme.navTitleTextStyle,
  ),
)
```
