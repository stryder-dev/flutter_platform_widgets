- [Platform Scaffold](#platform-scaffold)
- [Platform Tab scaffold](#platform_tab_scaffold)
- [Platform App bar](#platform_app_bar)
- [Platform Nav bar](#platform_nav_bar)
- [Platform Alert Dialog](#platform_alert_dialog)
- [Platform Alert dialog action](#platform_alert_dialog_action)
- [Platform Elevated button](#platform_elevated_button)
- [Platform Text button](#platform_text_button)
- [Platform Text](#platform_text)
- [Platform Switch](#platform_switch)
- [Platform Slider](#platform_slider)
- [Platform Text field](#platform_text_field)
- [Platform Text form field ](#platform_text_form_field)
- [Platform Icon button](#platform_icon_button)
- [Platform Circular progress indicator](#platform_circular_progress_indicator)
- [Platform Popup menu](#platform_popup_menu)
- [Platform Modal bottom sheet](#platform_modal_bottom_sheet)
- [Platform Date picker](#platform_date_picker)

These are the building blocks that you can use to replace your widgets with to get both Material and Cupertino styled widgets. 

## Platform Scaffold  <a name="platform_scaffold"></a>

A Scaffold that provides the correctly hosted header (AppBar) and navigation bar (Bottom Bar) for each platform. Uses `Scaffold` for material or `CupertinoTabScaffold` for cupertino with bottom tabs or `CupertinoPageScaffold` for cupertino without bottom tabs.

```dart
return PlatformScaffold(
  appBar: PlatformAppBar()
  body: _buildContent(),
  bottomNavBar: PlatformNavBar(),
  iosContentPadding: false,
  iosContentBottomPadding: false
);
```

> Note that the use of `iosContentPadding = true` is only required if the content is being obstructed behind the appBar. `iosContentBottomPadding` is used if the content needs to be above the navBar and not go behind it. This will not have the translucent effect for iOS when these are set to `true`. If that is desirable, then the scrolling and content alignment need to be managed yourself.

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | Scaffold | material: (_, __)  => MaterialScaffoldData(...) |
| Cupertino | CupertinoPageScaffold | cupertino: (_, __) => CupertinoPageScaffoldData(...) |
| Cupertino | CupertinoTabScaffold | cupertino: (_, __) => CupertinoPageScaffoldData(...) |

**NOTE**

If you need to have Scaffold with tabs it is better to use `PlatformTabScaffold`.

## Platform Tab scaffold <a name="platform_tab_scaffold"></a>

> Note: Using `PlatformTabScaffold` provides a more refined and flexible experience than using `PlatformScaffold`.

A Scaffold that provides the correctly hosted header (AppBar) and navigation bar (Bottom Bar) for each platform. Uses `Scaffold` for material or `CupertinoTabScaffold` for cupertino with bottom tabs.

```dart
return PlatformTabScaffold(
  tabController: tabController,
  appBarBuilder: (_, index) => PlatformAppBar(),
  bodyBuilder: (context, index) => _buildContent(index),
  items: _items(context),
);
```

More more detailed example look at:

- [Basic Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tab_pages/basicTabbedPage.dart)
- [Sliver Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tab_pages/sliverTabbedPage.dart)
- [Dynamic Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tab_pages/dynamicTabbedPage.dart)

> Note that the use of `iosContentPadding = true` is only required if the content is being obstructed behind the appBar. `iosContentBottomPadding` is used if the content needs to be above the navBar and not go behind it. This will not have the translucent effect for iOS when these are set to `true`. If that is desirable, then the scrolling and content alignment need to be managed yourself.

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | Scaffold | material: (_, __)  => MaterialTabScaffoldData(...) |
| Material | Scaffold | materialTabs: (_, __)  => MaterialNavBarData(...) |
| Cupertino | CupertinoPageScaffold | cupertino: (_, __) => CupertinoTabScaffoldData(...) |
| Cupertino | CupertinoTabScaffold | cupertinoTabs: (_, __) => CupertinoTabBarData(...) |

## Platform App bar <a name="platform_app_bar"></a>

The AppBar is the top Header bar with a title, left-side or right-side buttons. Uses `AppBar` for material or `CupertinoNavigationBar` for cupertino.

```dart
return PlatformAppBar(
    title: new Text('Platform Widgets'),
    leading: PlatformIconButton(),
    trailingActions: <Widget>[
      PlatformIconButton(),
    ],
  );
```

> In Cupertino if a solid color header is required and there is a ListView
> on the page, you would need to add some alpha to the color so that the
> ListView is not pushed down too far

```
     appBar: PlatformAppBar(
       title: Text('iOS Colored Header'),
       cupertino: (_, __) => CupertinoNavigationBarData(
             // Issue with cupertino where a bar with no transparency
             // will push the list down. Adding some alpha value fixes it (in a hacky way)
             backgroundColor: Colors.lightGreen.withAlpha(254),
           ),
     ),
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | AppBar | material: (_, __)  => MaterialAppBarData(...) |
| Cupertino | CupertinoNavigationBar | cupertino: (_, __) => CupertinoNavigationBarData(...) |

## Platform Nav bar <a name="platform_nav_bar"></a>

The NavBar is placed at the bottom of the page with a set of buttons that typically navigate between screens. Implementing this widget requires the parent widget to manage the `currentIndex` of the page and to set `PlatformNavBar.currrentIndex`. Uses `BottomAppBar` with `BottomNavigationBar` for material or `CupertinoTabBar` for cupertino.

```dart
return PlatformNavBar(
  currentIndex: _selectedTabIndex,
  itemChanged: (index) => setState(
        () {
          _selectedTabIndex = index;
        },
      ),
  items: [
    BottomNavigationBarItem(),
    BottomNavigationBarItem(),
  ],
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | BottomAppBar | material: (_, __)  => MaterialNavBarData(...) |
| Cupertino | CupertinoTabBar | cupertino: (_, __) => CupertinoTabBarData(...) |

## Platform Alert Dialog <a name="platform_alert_dialog"></a>

The AlertDialog will render a caption/title, body/text and a set of action buttons specific for the platform. Uses `AlertDialog` for material or `CupertinoAlertDialog` for cupertino.

> Note use `showPlatformDialog` instead of either `showDialog` from the Material library or `showCupertinoDialog` from the Cupertino library.

```dart
showPlatformDialog(
  context: context,
  builder: (_) => PlatformAlertDialog(
    title: Text('Alert'),
    content: Text('Some content'),
    actions: <Widget>[
      PlatformDialogAction(),
      PlatformDialogAction(),
    ],
  ),
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | AlertDialog | material: (_, __)  => MaterialAlertDialogData(...) |
| Cupertino | CupertinoAlertDialog | cupertino: (_, __) => CupertinoAlertDialogData(...) |

## Platform Alert dialog action <a name="platform_alert_dialog_action"></a>

The DialogAction widget is used to describe the set of buttons on the AlertDialog. Uses `TextButton` for material or `CupertinoDialogAction` for cupertino. 

```dart
PlatformDialogAction(
  child: PlatformText('Cancel'),
  onPressed: () => Navigator.pop(context),
),
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | TextButton | material: (_, __)  => MaterialDialogActionData(...) |
| Cupertino | CupertinoDialogAction | cupertino: (_, __) => CupertinoDialogActionData(...) |

## Platform Elevated button <a name="platform_elevated_button"></a>

A platform button that renders an `ElevatedButton` or `ElevatedButton.icon` for material or a `CupertinoButton.filled` for cupertino.

```dart
PlatformElevatedButton(
  child: PlatformText('Cancel'),
  onPressed: () => Navigator.pop(context),
),
``` 

**Note**
The icon can only be applied to a the material `ElevatedButton` when the `icon` property is set. There is no corresponding icon button for cupertino.
Cupertino to support backward compatibility supports rendering the `CupertinoButton` when the `originalStyle` property is set.

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | ElevatedButton | material: (_, __)  => MaterialElevatedButtonData(...) |
| Material | ElevatedButton.icon | material: (_, __)  => MaterialElevatedButtonData(icon: Icon(Icons...)) |
| Cupertino | CupertinoButton.filled | cupertino: (_, __) => CupertinoElevatedButtonData(...) |
| Cupertino | CupertinoButton | cupertino: (_, __) => CupertinoElevatedButtonData(originalStyle: true) |

## Platform Text button <a name="platform_text_button"></a>

A platform button that renders an `TextButton` or `TextButton.icon` for material or a `CupertinoButton` for cupertino.

```dart
PlatformElevatedButton(
  child: PlatformText('Cancel'),
  onPressed: () => Navigator.pop(context),
),
``` 

**Note**
The icon can only be applied to a the material `ElevatedButton` when the `icon` property is set. There is no corresponding icon button for cupertino.
Cupertino to support backward compatibility supports rendering the `CupertinoButton.filled` when the `originalStyle` property is set.

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | TextButton | material: (_, __)  => MaterialTextButtonData(...) |
| Material | TextButton.icon | material: (_, __)  => MaterialTextButtonData(icon: Icon(Icons...)) |
| Cupertino | CupertinoButton| cupertino: (_, __) => CupertinoTextButtonData(...) |
| Cupertino | CupertinoButton.filled | cupertino: (_, __) => CupertinoTextButtonData(originalStyle: true) |

## Platform Text <a name="platform_text"></a>

A widget that will render `uppercase` for material. Cupertino will remain unchanged.

```dart
return PlatformText('Cancel');
```

## Platform Switch <a name="platform_switch"></a>

A switch widget that will use a `Switch` for material or a `CupertinoSwitch` for cupertino.

```dart
return PlatformSwitch(
  onChanged: (bool value) {},
  value: value,
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | Switch | material: (_, __)  => MaterialSwitchData(...) |
| Cupertino | CupertinoSwitch | cupertino: (_, __) => CupertinoSwitchData(...) |

## Platform Slider <a name="platform_slider"></a>

A slider widget that will use a `Slider` for material or a `CupertinoSlider` for cupertino

```dart
return PlatformSlider(
  onChanged: (bool value) {},
  value: value,
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | Slider | material: (_, __)  => MaterialSliderData(...) |
| Cupertino | CupertinoSlider | cupertino: (_, __) => CupertinoSliderData(...) |

## Platform Text field <a name="platform_text_field"></a>

A text field widget that will use a `TextField` for material or a `CupertinoTextField` for cupertino.

```dart
return PlatformTextField();
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | TextField | material: (_, __)  => MaterialTextFieldData(...) |
| Cupertino | CupertinoTextField | cupertino: (_, __) => CupertinoTextFieldData(...) |

## Platform Text form field <a name="platform_text_form_field"></a>

A text field widget that will use a `TextFormField` for material or a `CupertinoTextFormFieldRow` for cupertino.

```dart
return PlatformTextFormField();
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | TextFormField | material: (_, __)  => MaterialTextFormFieldData(...) |
| Cupertino | CupertinoTextFormFieldRow | cupertino: (_, __) => CupertinoTextFormFieldData(...) |

## Platform Icon button <a name="platform_icon_button"></a>

A clickable (tappable) button with an icon. Uses `IconButton` for material or `CupertinoButton` for cupertino.

```dart
return PlatformIconButton(
  onPressed: () => print('info pressed'),
  materialIcon: Icon(Icons.info),
  cupertinoIcon: Icon(
    CupertinoIcons.info,
    size: 28.0,
  ),
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | IconButton | material: (_, __)  => MaterialIconButtonData(...) |
| Cupertino | CupertinoButton | cupertino: (_, __) => CupertinoIconButtonData(...) |

## Platform Circular progress indicator <a name="platform_circular_progress_indicator"></a>

A circular looking progress indicator. Uses `CircularProgressIndicator` for material or `CupertinoActivityIndicator` for cupertino.

```dart
return PlatformCircularProgressIndicator();
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | CircularProgressIndicator | material: (_, __)  => MaterialProgressIndicatorData(...) |
| Cupertino | CupertinoActivityIndicator | cupertino: (_, __) => CupertinoProgressIndicatorData(...) |

## Platform Popup menu <a name="platform_popup_menu"></a>

The PlatformPopupMenu will render a using a `PopupMenuButton` for material or use a `CupertinoActionSheet` for cupertino which will display a list of actions.

```dart
return PlatformPopupMenu(
  options: [
    PopupMenuOption(label: 'One', onTap: _navToPageOne),
    PopupMenuOption(label: 'Two', onTap: _navToPageTwo),
    PopupMenuOption(label: 'Three', onTap: _navToPageThree)
  ],
  icon: Icon(
    context.platformIcon(
      material: Icons.more_vert_rounded,
      cupertino: CupertinoIcons.ellipsis,
    ),
  ),
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | PopupMenuButton | material: (_, __)  => MaterialPopupMenuData(...) |
| Cupertino | CupertinoActionSheet | cupertino: (_, __) => CupertinoPopupMenuData(...) |


## Platform Modal bottom sheet <a name="platform_modal_bottom_sheet"></a>

Display the platform specific modal bottom sheet...

```dart
 showPlatformModalSheet(
      context: context,
      builder: (_) => YourSheetContent(),
    );
```

Uses:
| Platform  | Widget function  | Extended props add...
|---|---|---|
| Material | showModalBottomSheet | material: (_, __)  => MaterialModalSheetData(...) |
| Cupertino | showCupertinoModalPopup | cupertino: (_, __) => CupertinoModalSheetData(...) |

> Note: Since Material and Cupertino content may be quite different it may be useful to use `PlatformWidget`

```dart
 showPlatformModalSheet(
      context: context,
      PlatformWidget(
        material: (_, __)  => _materialPopupContent(),
        cupertino: (_, __) => _cupertinoSheetContent(),
      ),
    );
```

## Platform Date picker <a name="platform_date_picker"></a>

Display either the default `material` date picker or use a slightly opioninated version of a date picker for `cupertino` which uses a bottom sheet.

```dart
 showPlatformDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 1000)),
    lastDate: DateTime.now().add(const Duration(days: 1000)),
  );
```

Uses:
| Platform  | Widget function  | Extended props add...
|---|---|---|
| Material | showDatePicker | material: (_, __)  => MaterialDatePickerData(...) |
| Cupertino | (custom) | cupertino: (_, __) => CupertinoDatePickerData(...) |

> Note: The Cupertino popup uses a modal bottom sheet with a default cupertino date picker tumbler. If you need to customize the look then set the `cupertinoContentBuilder` property and return a custom content. If you create your own content builder you will need to manage the state of the date yourself. See the implementation of using `StatefulBuilder` or `StatefulWidget` to manage state updates within the example project.

```dart
final date = await showPlatformDatePicker(
  context: context,
  firstDate: DateTime.now().subtract(const Duration(days: 100)),
  lastDate: DateTime.now().add(const Duration(days: 100)),
  initialDate: DateTime.now(),
  cupertinoContentBuilder: (contentData, data) =>
      _CustomCupertinoDatePicker(contentData: contentData),
);
```

`cupertinoContentBuilder` is a builder function passing in an instance of `DatePickerContentData` and optional `CupertinoDatePickerData`. The returned widget will be a custom designed widget that you return to display within the modal bottom sheet.
