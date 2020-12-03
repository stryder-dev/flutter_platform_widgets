# Flutter Platform Widgets

![Pub](https://img.shields.io/pub/v/flutter_platform_widgets) ![GitHub](https://img.shields.io/github/license/stryder-dev/flutter_platform_widgets)

This project is an attempt to see if it is possible to create widgets that are platform aware. Currently in order to render targeted Material or Cupertino device specific styles, you need to either conditionaly check the platform or create a set of widgets to render differently depending on the running platform.

This package supports the **Stable** release as a full released version.

Beta or Dev channels might be supported when there is a pre-release version. Please check the CHANGELOG for version compatibility version.

Due to Master being in rapid development this package is unable to support Master. If this support is required then it is best to fork the repo and locally reference the forked version where changes can be made appropriately.

# Installation

> pub.dev: https://pub.dev/packages/flutter_platform_widgets

# How it works

The flutter `ThemeData` object used with the `Theme` widget has a `platform` property. This defaults to `TargetPlatform.android` on Android and `TargetPlatform.ios` on iOS (also for macos etc), but when creating a ThemeData object, it can be set programmatically. Calling `Theme.of(context).platform` will return the current platform. Several Flutter library widgets use this field to change how they are rendered, and all of the Flutter Platform Widgets library widgets use this field to render the platform specific versions of things.

# Configuration

See [PlatformProvider](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformprovider) for configuration options.

# Widgets

These set of widgets allow for rendering based on the target platform using a single cross platform set of widget.

![alt text](images/android.png)

![alt text](images/ios.png)

Each `PlatformWidget` provides common properties directly as constructor arguments. If required further customization can be achieved by using the platform widget builder. See the **Enhance** section of each widget.

- [PlatformWidget](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformwidget)
- [PlatformText](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformtext)
- [PlatformSwitch](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformswitch)
- [PlatformSlider](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformslider)
- [PlatformTextField](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformtextfield)
- [PlatformButton](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformbutton)
- [PlatformIconButton](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformiconbutton)
- [PlatformApp](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformapp)
- [PlatformScaffold](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformscaffold)
- [PlatformTabScaffold](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformtabscaffold)
- [PlatformAppBar](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformappbar)
- [PlatformNavBar](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformnavbar)
- [PlatformAlertDialog](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformalertdialog)
- [PlatformDialogAction](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformdialogaction)
- [PlatformCircularProgressIndicator](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformcircularprogressindicator)
- [PlatformPageRoute](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformpageroute)
- [ShowPlatformModalSheet](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#showplatformmodalsheet)
- [PlatformProvider](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformprovider)
- [PlatformIcons](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformicons)
- [PlatformWidgetBuilder](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/README.md#platformwidgetbuilder)

## PlatformWidget

A widget that will render either the material widget or cupertino widget based on the target platform. The widgets themselves do not need to be specifically Material or Cupertino.

```dart
return PlatformWidget(
  cupertino: (_, __) => Icon(CupertinoIcons.flag),
  material: (_, __)  => Icon(Icons.flag),
);
```

## PlatformText

A widget that will render uppercase for material. Cupertino will remain unchanged.

```dart
return PlatformText('Cancel');
```

## PlatformSwitch

A switch widget that will use a `Switch` for material or a `CupertinoSwitch` for cupertino.

```dart
return PlatformSwitch(
  onChanged: (bool value) {},
  value: value,
);
```

#### Enhance

```dart
return PlatformSwitch(
  onChanged: (bool value) {},
  value: value,
  material: (_, __)  => MaterialSwitchData(...),
  cupertino: (_, __) => CupertinoSwitchData(...)
);
```

## PlatformSlider

A slider widget that will use a `Slider` for material or a `CupertinoSlider` for cupertino

```dart
return PlatformSlider(
  onChanged: (bool value) {},
  value: value,
);
```

#### Enhance

```dart
return PlatformSlider(
  onChanged: (bool value) {},
  value: value,
  material: (_, __)  => MaterialSliderData(...),
  cupertino: (_, __) => CupertinoSliderData(...)
);
```

## PlatformTextField

A text field widget that will use a `TextField` for material or a `CupertinoTextField` for cupertino.

```dart
return PlatformTextField();
```

#### Enhance

```dart
return PlatformTextField(
  material: (_, __)  => MaterialTextFieldData(...),
  cupertino: (_, __) => CupertinoTextFieldData(...)
);
```

## PlatformButton

A button that will render a `RaisedButton` or `FlatButton` for material or a `CupertinoButton` for cupertino.

```dart
return PlatformButton(
  onPressed: () => print('send'),
  child: PlatformText('Send'),
);
```

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformButton(
  onPressed: () => print('send'),
  child: PlatformText('Send'),
  material: (_, __)  => MaterialRaisedButtonData(...),
  cupertino: (_, __) => CupertinoButtonData(...)
);
```

> Note: For material you can use the `FlatButton` instead. To do this use the `MaterialFlatButtonData` on the `materialFlat` argument.

> NoteL For cupertino you can use the `CupertinoButton.filled` instead. To do this use the `CupertinoFilledButtonData` on the `cupertinoFilled` argument.

```dart
return PlatformButton(
 onPressed: () => print('send'),
 child: PlatformText('Send'),
 materialFlat: (_, __)    => MaterialFlatButtonData(),
 cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
);
```

## PlatformIconButton

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

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
Widget infoIconButton() {
  return PlatformIconButton(
    onPressed: () => print('info pressed'),
    materialIcon: Icon(Icons.info),
    cupertinoIcon: Icon(CupertinoIcons.info),
    material: (_, __)  => MaterialIconButtonData(...),
    cupertino: (_, __) => CupertinoIconButtonData(...),
  );
}
```

## PlatformApp

A top level widget for the applciation that uses `MaterialApp` for material or `CupertinoApp` for cupertino.

```dart
return PlatformApp(
  title: 'Flutter Demo',
  home: ...
);
```

or

```dart
return PlatformApp.router(
  routeInformationParser: ...
  routerDelegate: ...
)
```

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformApp(
  home:  ...
  material: (_, __)  => MaterialAppData(...)
  cupertino: (_, __) => CupertinoAppData(...)
);
```

or 

```dart
return PlatformApp.router(
  material: (_, __)  => MaterialAppRouterData(...)
  cupertino: (_, __) => CupertinoAppRouterData(...)
);
```

## PlatformScaffold

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

> Note that the use of `iosContentPadding = true` is only required if the content is being obstruced behind the appBar. `iosContentBottomPadding` is used if the content needs to be above the navBar and not go behind it. This will not have the translucent effect for iOS when these are set to `true`. If that is desirable, then the scrolling and content alignment need to be managed yourself.

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformScaffold(
  appBar: PlatformAppBar()
  body: _buildContent(),
  bottomNavBar: PlatformNavBar(),
  material: (_, __)  => MaterialScaffoldData(...)
  cupertino: (_, __) => CupertinoPageScaffoldData(...);
);
```

> Both the material and cupertino builders are optional. If not provided the `Container` placeholder widget will be returned.

## PlatformTabScaffold

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

- [Basic Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tabbed/basicTabbedPage.dart)
- [Sliver Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tabbed/sliverTabbedPage.dart)
- [Dynamic Example](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/example/lib/tabbed/dynamicTabbedPage.dart)

> Note that the use of `iosContentPadding = true` is only required if the content is being obstruced behind the appBar. `iosContentBottomPadding` is used if the content needs to be above the navBar and not go behind it. This will not have the translucent effect for iOS when these are set to `true`. If that is desirable, then the scrolling and content alignment need to be managed yourself.

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformTabScaffold(
  tabController: tabController,
  appBarBuilder: (_, index) => PlatformAppBar(),
  bodyBuilder: (context, index) => _buildContent(index),
  items: _items(context),
  material: (_, __)  => MaterialTabScaffoldData(...)
  cupertino: (_, __) => CupertinoTabScaffoldData(...);
  materialtabs: (_, __) => MaterialNavBarData(...)
  cupertinoTabs: (_, __) => CupertinoTabBarData(...);
);
```

> Both the material and cupertino builders are optional. If not provided the `SizedBox.shrink()` placeholder widget will be returned.
> `material` can be replaced with `materialBuilder` for dynamic rendering on index change
> `cupertino` can be replaced with `cupertinoBuilder` for dynamic rendering on index change

## PlatformAppBar

The AppBar is the top Header bar with a title, leftside or rightside buttons. Uses `AppBar` for material or `CupertinoNavigationBar` for cupertino.

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

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformAppBar(
  title: new Text('Platform Widgets'),
  leading: PlatformIconButton(),
  trailingActions: <Widget>[
    PlatformIconButton(),
  ],
  material: (_, __)  => MaterialAppBarData(...),
  cupertino: (_, __) => CupertinoNavigationBarData(...),
);
```

## PlatformNavBar

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

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

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
  material: (_, __)  => MaterialNavBarData(...),
  cupertino: (_, __) => CupertinoTabBarData(...),
);
```

## PlatformAlertDialog

The AlertDialog will render a caption/title, body/text and a set of action buttons specific for the platform. Uses `AlertDialog` for material or `CupertinoAlertDialog` for cupertino.

> Note use `showPlatformDialog` instead of either `showDialog` from the Material library or `showCupertinoDialog` from the Cupertino library.

![alt text](images/android-dialog.png)

![alt text](images/ios-dialog.png)

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

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
showDialog(
  context: context,
  builder: (_) => PlatformAlertDialog(...),
  cupertino: (_, __) => CupertinoAlertDialogData(...),
  material: (_, __)  => MaterialAlertDialogData(...),
)
```

## PlatformDialogAction

The DialogAction widget is used to describe the set of buttons on the AlertDialog. Uses `FlatButton` for material or `CupertinoDialogAction` for cupertino.

```dart
PlatformDialogAction(
  child: PlatformText('Cancel'),
  onPressed: () => Navigator.pop(context),
),
```

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
PlatformDialogAction(
  child: PlatformText('Cancel'),
  onPressed: () => Navigator.pop(context),
  material: (_, __)  => MaterialDialogActionData(...),
  cupertino: (_, __) => CupertinoDialogActionData(...),
),
```

## PlatformCircularProgressIndicator

A circular looking progress indicator. Uses `CircularProgressIndicator` for material or `CupertinoActivityIndicator` for cupertino.

```dart
return PlatformCircularProgressIndicator();
```

#### Enhance

Extend with `WidgetBuilder` for material or cupertino.

```dart
return PlatformCircularProgressIndicator(
  material: (_, __)  => MaterialProgressIndicatorData(...),
  cupertino: (_, __) => CupertinoProgressIndicatorData(...),
);
```

## PlatformPageRoute

This function can be used within the `Navigator` to push either the `MaterialPageRoute` for material or `CupertinoPageRoute` for cupertino.

```dart
  Navigator.push(
    context,
    platformPageRoute(
      builder: pageToDisplayBuilder,
    ),
  );
```

## ShowPlatformModalSheet

This function is used to either display a `ModalBottomSheet` for material or `CupertinoModalPopup` for cupertino.

```dart
  showPlatformModalSheet(
      context: context,
      builder: (_) => PlatformWidget(
        material: (_, __)  => _materialPopupContent(),
        cupertino: (_, __) => _cupertinoSheetContent(),
      ),
    );
```

> Note: Since Material and Cupertino content may be quite different it may be useful tl use `PlatformWidget`.

## PlatformProvider

A Provider that provides access to the functions of switching platforms which can be accessed from any screen.

Requires to be placed at the root (above MaterialApp, CupertinoApp or PlatformApp).

```dart
  return PlatformProvider(
    builder: (BuildContext context) => MaterialApp(...)
  );
```

### Arguments

#### initialPlatform

An optional argument `initialPlatform` can be passed in to force the platform upon startup. This could be useful for development or if the platform is persisted externally (i.e. Shared preferences) and needs to be set on startup.

And to switch platforms...

```
PlatformProvider.of(context).changeToMaterialPlatform();
```

or

```
PlatformProvider.of(context).changeToCupertinoPlatform();
```

or

```
PlatformProvider.of(context).changeToPlatform(Platform.fuchsia);
```

This will set the `Theme.of(context).platform` but the platform widgets will use the style as defined in the `PlatformStyle` as set inside the settings object. See below.

#### settings

The settings argument have been added to assist in configuring Platform Widgets.

_iosUsesMaterialWidgets_

- If true it will add a Material widget above the CupertinoPageScaffold so that Material widgets can be added to the ios page. This does affect dark mode and some ios rendering so it is best to have it false (default). If you use Material widgets on the page simply add `Material(child: yourWidget)`.

_platformStyle_

- Provides a way to set either `Material` or `Cupertino` style on any supported platforms such as android, ios, web, macos, fuchsia, windows amd linux. For example if you wanted to use `Cupertino` widgets for web you would configure by setting the settings object on `PlatformProvider`:

```
PlatformProvider(
  settings: PlatformSettingsData(
    platformStyle: PlatformStyleData(web: PlatformStyle.Cupertino)
  ),
  builder: (context) => PlatformApp(...)
)
```

## PlatformIcons

Render a Material or Cupertino looking icon

```dart
  Icon(context.platformIcons.book)
//or
  Icon(PlatformIcons(context).book)
```

View the [source](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_icons.dart) or [screenshots](https://github.com/stryder-dev/flutter_platform_widgets/blob/master/ICONS.md) for the list of icons.

## PlatformWidgetBuilder

Renders a parent widget for either `Cupertino` or `Material` while sharing a common child Widget

```dart
 PlatformWidgetBuilder(;
   cupertino: (_, child, __) => GestureDetector(child: child, onTap: _handleTap),
   material: (_, child, __) => IniWell(child: child, onTap: _handleTap),
   child: Container(child: Text('Common text')),
 );
```

# TODO

- UI / Unit Tests.
- Code documentation

# Changing / Checking Platform

When importing `flutter_platform_widgets` you can check `isMaterial(context)` or `isCupertino(context)` to determine what style will be used. This is independent to `Platform.isAndroid` or `Platform.isIOS` from `'import 'dart:io'`

You can call `platform(context)` to get the current platform. This is an enhancement on the existing `TargetPlatform` enum which now includes a value for web.

See the example code for how this is used.

# Issues and Feedback

Please [create](https://github.com/stryder-dev/flutter_platform_widgets/issues/new) an issue to provide feedback or an issue.

# Contributers

Special thanks for everyone that have contributed to this project...

|                                                                                                       |                                                               |                                                                                                       |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| [![](https://avatars1.githubusercontent.com/u/4413519?s=40&v=4)](https://github.com/aqwert)           | [Lance Johnstone](https://github.com/aqwert)                  | [![](images/linkedIn_img.png)](https://www.linkedin.com/in/lancejohnstone/)                           |
| [![](https://avatars2.githubusercontent.com/u/58397?s=40&v=4)](https://github.com/stefanrusek)        | [Stefan Rusek](https://github.com/stefanrusek)                |
| [![](https://ui-avatars.com/api/?name=Mark+Lavercombe&size=40)](https://github.com/mlava)             | [Mark Lavercombe](https://github.com/mlava)                   |
| [![](https://avatars3.githubusercontent.com/u/15651?s=40&v=4)](https://github.com/fredgrott)          | [Fred Grott](https://github.com/fredgrott)                    | [![](images/linkedIn_img.png)](https://www.linkedin.com/in/fredgrottstartupfluttermobileappdesigner/) |
| [![](https://avatars0.githubusercontent.com/u/26111180?s=40&v=4)](https://github.com/fbernutz)        | [Felizia Bernutz](https://github.com/fbernutz)                |
| [![](https://avatars3.githubusercontent.com/u/227856?s=40&v=4)](https://github.com/eyecreate)         | [eyecreate](https://github.com/eyecreate)                     |
| [![](https://avatars1.githubusercontent.com/u/53199186?s=40&v=4)](https://github.com/ahawlitschek)    | [Adrian](https://github.com/ahawlitschek)                     |
| [![](https://avatars2.githubusercontent.com/u/244358?s=40&v=4)](https://github.com/ericmartineau)     | [Eric Martineau](https://github.com/ericmartineau)            |
| [![](https://avatars2.githubusercontent.com/u/10937624?s=40&v=4)](https://github.com/GillesMontyne)   | [Gilles Montyne](https://github.com/GillesMontyne)            |
| [![](https://avatars2.githubusercontent.com/u/1435744?s=40&v=4)](https://github.com/sck-v)            | [Ivan Kryak](https://github.com/sck-v)                        |
| [![](https://ui-avatars.com/api/?name=Morris+Haid&size=40)](https://github.com/mhaid)                 | [Morris Haid](https://github.com/mhaid)                       |
| [![](https://ui-avatars.com/api/?name=Joscha+Eckert&size=40)](https://github.com/josxha)              | [Joscha Eckert](https://github.com/josxha)                    |
| [![](https://avatars1.githubusercontent.com/u/1281777?s=40&v=4)](https://github.com/furkantektas)     | [Furkan Tektas](https://github.com/furkantektas)              |
| [![](https://avatars3.githubusercontent.com/u/2480235?s=40&v=4)](https://github.com/dabenzel)         | [benzel](https://github.com/dabenzel)                         |
| [![](https://avatars1.githubusercontent.com/u/1858194?s=40&v=4)](https://github.com/cmengler)         | [Christian Mengler](https://github.com/cmengler)              |
| [![](https://avatars1.githubusercontent.com/u/814785?s=40&v=4)](https://github.com/cbenhagen)         | [Ben Hagen](https://github.com/cbenhagen)                     |
| [![](https://avatars2.githubusercontent.com/u/340836?s=40&v=4)](https://github.com/anticafe)          | [anticafe](https://github.com/anticafe)                       |
| [![](https://avatars1.githubusercontent.com/u/14137351?s=40&v=4)](https://github.com/abahnj)          | [Nnaemeka Abah](https://github.com/abahnj)                    |
| [![](https://avatars1.githubusercontent.com/u/11311182?s=40&v=4)](https://github.com/OnyekachiSamuel) | [Ezeoke Onyekachi Samuel](https://github.com/OnyekachiSamuel) |
| [![](https://avatars0.githubusercontent.com/u/7694636?s=40&v=4)](https://github.com/KoningJasper)     | [Jasper Koning](https://github.com/KoningJasper)              |
| [![](https://ui-avatars.com/api/?name=AlexIver&size=40)](https://github.com/AlexIver)                 | [AlexIver](https://github.com/AlexIver)                       |
| [![](https://avatars1.githubusercontent.com/u/35923031?s=40&v=4)](https://github.com/in74mz)          | [in74mz](https://github.com/in74mz)                           |
| [![](https://avatars0.githubusercontent.com/u/1169185?s=40&v=4)](https://github.com/DFelten)          | [Daniel Felten](https://github.com/DFelten)                    |

# Acknowledgements

Inspired by the example given by Swav Kulinski (https://github.com/swavkulinski/flutter-platform-specific-widgets)
