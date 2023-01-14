
There are a number of settings that you can set that applies to the entire application when you add `PlatformProvider` above the main `PlatformApp` widget. To have additional settings, just add it to `settings` of the provider.

```dart
PlatformProvider(
  settings: PlatformSettingsData(...),
  builder: ...
)
```

#### Properties

**iosUsesMaterialWidgets**

If you plan to use a mixture of `Material` and `Cupertino` widgets within your app and use `PlatformApp` for iOS then you need to set the following

This is because `material` widgets expect a `Scaffold` or `Material` parent widget which by default is not added when using the `cupertino` widgets.

**platformStyle**

By default the style of an android application will take the `material` style, and an apple application will take the `cupertino` style. You can change what style the target platform will have by setting the `platformStyle` property.

The following are the defaults used.

| Platform  | Style  |
|---|---|
| android  |  Material  |
| windows  |  Material  |
| web  |  Material  |
| fushia  |  Material  |
| linux  |  Material  |
| ios  |  Cupertino  |
| macos  |  Cupertino  |

**iosUseZeroPaddingForAppbarPlatformIcon**

From v2.1 you can ensure that for a `PlatformIconButton` added to the cupertino app bar have zero padding which is required to visually align properly on the app bar. This zero padding is ignored if the `PlatformIconButton` already has a padding added to it.

**legacyIosUsesMaterialWidgets**

Not recommended to set, however exists for older projects that want to ensure a `Material` as a parent. Prefer setting `iosUsesMaterialWidgets`

### Extended properties

Each platform widget has the list of properties shared between `material` and `cupertino` within the platform constructor itself, in the same way the default flutter widgets are made. However not all properties are common between the two. So in this case you can further customise the platform widget specifically for the target platform.

Take the `PlatformTextButton` widget as an example:

```dart
return PlatformElevatedButton(
  onPressed: onPressed, 
  child: const Text('Click Me!'),
);
```

Here the `onPressed` and `child` properties are common between `material` and `cupertino` so they are provided directly on the `PlatformTextButton` constructor. However what is being used for `material` is the `TextButton` widget and for `cupertino` it is the `CupertinoButton` widget. If you want to change or handle something specific for the target platform widget you need to extend it by doing this...

```dart
return PlatformElevatedButton(
  onPressed: onPressed, 
  child: const Text('Click Me!'),
  material: (_, __) => MaterialTextButtonData(
    autofocus: true,
  ),
  cupertino: (_, __) => CupertinoTextButtonData(
    disabledColor: Colors.white
  ),
);
```

The `(_, __)` builder arguments are `BuildContext` and `PlatformTarget` which you can use explicitly if you need to use the context or need to know about the platform that is being targeted.

To get the full list of possible extended properties for each platform widget it is best to look at the source code itself as the amount of properties some of the widgets have is just too much to list.